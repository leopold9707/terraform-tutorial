#### INSTANCE HTTP ####

# Create instance
resource "aws_instance" "instance_list" {
  for_each	= { for instance in var.instance_list : instance.vm-name => instance }
  
  ami           = var.ami_id.centos7
  instance_type = each.value.flavor
  key_name      = aws_key_pair.terraform.key_name
  vpc_security_group_ids = [
    aws_security_group.terraform-default[each.value.subnet_name].id
  ]
  subnet_id = aws_subnet.subnet_list[each.value.subnet_name].id
  associate_public_ip_address = true
  user_data = file("first-boot.sh")
  root_block_device {
    volume_type = "gp2"
    volume_size = each.value.root_volume_size
    delete_on_termination = true
  }
  tags = {
    Name = each.value.vm-name
  }
}

# Create volume
resource "aws_ebs_volume" "additional_storage" {
  for_each = { for instance in var.instance_list : instance.vm-name => instance }
  
  availability_zone = aws_instance.instance_list[each.value.vm-name].availability_zone
  size              = each.value.additional_volume
  tags = {
    Name = each.value.vm-name
  }
}

# Attach volume to instance
resource "aws_volume_attachment" "additional_storage" {
  for_each = { for instance in var.instance_list : instance.vm-name => instance }

  device_name  = "/dev/xvdb"
  skip_destroy = false
  volume_id    = aws_ebs_volume.additional_storage[each.value.vm-name].id
  instance_id  = aws_instance.instance_list[each.value.vm-name].id
}
/*
# Attach floating ip on Admin instance
resource "aws_eip" "vpc_1_admin" {
  vpc        = true
  instance   = aws_instance.instances["primary-101"].id
  depends_on = [aws_internet_gateway.gws["vpc-1"]]
  tags = {
    Name = "VPC_1_Admin_fip"
  }
}
*/
