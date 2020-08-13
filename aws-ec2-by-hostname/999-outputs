output host_private_ip_list {
  value = {
    for host in var.hosts:
    host => aws_instance.instances[host].private_ip
  }
}

output host_public_ip_list {
  value = {
    for host in var.hosts:
    host => aws_instance.instances[host].public_ip
  }
}
