# Network configuration

# VPC creation
resource "aws_vpc" "vpcs" {
  for_each = { for vpc in var.vpcs : vpc => var.vpc_info[vpc] }

  cidr_block           = each.value["vpc_cidr"]
  enable_dns_hostnames = true
  tags = {
    Name = each.key
  }
}

# Subnet Creation
resource "aws_subnet" "subnets" {
  for_each = { for subnet in var.subnets : subnet => var.subnet_info[subnet] }

  vpc_id     = aws_vpc.vpcs[each.value["vpc"]].id
  cidr_block = each.value["cidr"]
  availability_zone = each.value["availability_zone"]
  tags = {
    Name = each.key
  }
  depends_on = [aws_internet_gateway.gws]
}

# External gateway configuration
resource "aws_internet_gateway" "gws" {
  for_each = { for vpc in var.vpcs : vpc => var.vpc_info[vpc] }

  vpc_id = aws_vpc.vpcs[each.key].id
  tags = {
    Name = each.key
  }
}

# Routing table configuration
resource "aws_route_table" "routers" {
  for_each = { for vpc in var.vpcs : vpc => var.vpc_info[vpc] }

  vpc_id = aws_vpc.vpcs[each.key].id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gws[each.key].id
  }
}

# Associate router to subnet
resource "aws_route_table_association" "external-router" {
  for_each = { for subnet in var.subnets : subnet => var.subnet_info[subnet] }

  subnet_id      = aws_subnet.subnets[each.key].id
  route_table_id = aws_route_table.routers[each.value["vpc"]].id
}
