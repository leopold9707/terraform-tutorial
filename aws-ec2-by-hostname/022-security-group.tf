# Security group configuration

# Default administration port
resource "aws_security_group" "terraform-default" {
  for_each = var.vpc_info

  name        = each.key
  vpc_id      = aws_vpc.vpcs[each.key].id
  tags = {
    Name = each.key
  }

  # Open ssh port
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow icmp
  ingress {
    from_port   = 8
    to_port     = 0
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # http port
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # https port
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # for taco_apps
  ingress {
    from_port   = 30000
    to_port     = 30010
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # for taco_apps
  ingress {
    from_port   = 32000
    to_port     = 32020
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # for etcd
  ingress {
    from_port	= 2379
    to_port	= 2379
    protocol	= "tcp"
    cidr_blocks	= ["0.0.0.0/0"]
  }

  # for ceph
  ingress {
    from_port	= 6789
    to_port	= 7300
    protocol	= "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # allow all inbound traffic
  ingress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Open access to public network
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
