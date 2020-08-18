### NETWORK CREATION ###

## VPC ##

resource "aws_vpc" "vpc_list" {
  for_each = { for vpc in var.vpc_list : vpc.vpc_name => vpc }

  cidr_block           = each.value.vpc_cidr
  enable_dns_hostnames = true
  tags = {
    Name = each.value.vpc_name
  }
}

# Subnet Creation
resource "aws_subnet" "subnet_list" {
  for_each = { for subnet in var.subnet_list : subnet.subnet_name => subnet }

  vpc_id     = aws_vpc.vpc_list[each.value.which_vpc].id
  cidr_block = each.value["subnet_cidr"]
  availability_zone = each.value["subnet_az"]
  tags = {
    Name = each.value.subnet_name
  }
  depends_on = [aws_internet_gateway.gw_list]
}

# External gateway configuration
resource "aws_internet_gateway" "gw_list" {
  for_each = { for vpc in var.vpc_list : vpc.vpc_name => vpc }

  vpc_id = aws_vpc.vpc_list[each.value.vpc_name].id
  tags = {
    Name = each.value.vpc_name
  }
}

# Add internet gateway to route table
resource "aws_route_table" "router_list" {
  for_each = { for vpc in var.vpc_list : vpc.vpc_name => vpc }

  vpc_id = aws_vpc.vpc_list[each.value.vpc_name].id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw_list[each.value.vpc_name].id
  }
}

# Add subnet to route table
resource "aws_route_table_association" "route_association" {
  for_each = { for subnet in var.subnet_list : subnet.subnet_name => subnet }

  subnet_id      = aws_subnet.subnet_list[each.value.subnet_name].id
  route_table_id = aws_route_table.router_list[each.value.which_vpc].id
}
