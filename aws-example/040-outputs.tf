output private_ip_list {
  value = {
    for instance in var.instance_list:
    instance.vm-name => aws_instance.instance_list[instance.vm-name].private_ip
  }
}

output public_ip_list {
  value = {
    for instance in var.instance_list:
    instance.vm-name => aws_instance.instance_list[instance.vm-name].public_ip
  }
}
