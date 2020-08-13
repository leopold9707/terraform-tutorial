#### INSTANCE HTTP ####

# Create instance
resource "aws_instance" "instances" {
  for_each	= { for host in var.hosts[*] : host => var.host_info[host] }
  
  ami           = var.centos7
  instance_type = var.spec[each.value.role].flavor
  key_name      = aws_key_pair.terraform.key_name #var.user_key
  vpc_security_group_ids = [
    aws_security_group.terraform-default[var.subnet_info[each.value.subnet].vpc].id
  ]
  subnet_id = aws_subnet.subnets[each.value.subnet].id
  associate_public_ip_address = true
  user_data = file("first-boot.sh")
  root_block_device {
    volume_type = "standard"
    volume_size = var.spec[each.value.role].root_volume_size
    delete_on_termination = true
  }
  tags = {
    Name = each.key
 }
}

# Create volume
resource "aws_ebs_volume" "additional_storage" {
  for_each = { for host in var.hosts[*] : host => var.host_info[host] }
  
  availability_zone = aws_instance.instances[each.key].availability_zone
  size              = var.spec[each.value.role].additional_volume
}

# Attach volume to instance
resource "aws_volume_attachment" "additional_storage" {
  for_each = { for host in var.hosts[*] : host => var.host_info[host] }

  device_name  = "/dev/xvdh"
  force_detach = true
  volume_id    = aws_ebs_volume.additional_storage[each.key].id
  instance_id  = aws_instance.instances[each.key].id
}
/*
# Attach floating ip on Admin instance
resource "aws_eip" "vpc_1_admin" {
  vpc        = true
  instance   = aws_instance.instances["Primary-101"].id
  depends_on = [aws_internet_gateway.gws["VPC-1"]]
  tags = {
    Name = "VPC_1_Admin_fip"
  }
}

resource "aws_eip" "vpc_2_admin" {
  vpc        = true
  instance   = aws_instance.instances["Primary-201"].id
  depends_on = [aws_internet_gateway.gws["VPC-2"]]
  tags = {
    Name = "VPC_2_Admin_fip"
  }
}*/
