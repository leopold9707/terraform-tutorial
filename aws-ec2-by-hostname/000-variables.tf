#### VPC PARAMS
variable "vpcs" {
  default = [
    "VPC-1",
#    "VPC-2"
  ]
}

variable "vpc_info" {
  default = {
    VPC-1 = {
      vpc_cidr = "10.0.0.0/16"
    }
    VPC-2 = {
      vpc_cidr = "20.0.0.0/16"
    }
  }
}


#### SUBNET PARAMS
variable "subnets" {
  default = [
    "public_subnet_10_0_1",
#    "public_subnet_10_0_2",
#    "public_subnet_20_0_1",
#    "public_subnet_20_0_2"
  ]
}

variable "subnet_info" {
  default = {
    public_subnet_10_0_1 = {
      vpc               = "VPC-1"
      cidr              = "10.0.1.0/24"
      availability_zone = "ap-northeast-2a"
    }
    public_subnet_10_0_2 = {
      vpc               = "VPC-1"
      cidr              = "10.0.2.0/24"
      availability_zone = "ap-northeast-2c"
    }
    public_subnet_20_0_1 = {
      vpc               = "VPC-2"
      cidr              = "20.0.1.0/24"
      availability_zone = "ap-northeast-2a"
    }
    public_subnet_20_0_2 = {
      vpc               = "VPC-2"
      cidr              = "20.0.2.0/24"
      availability_zone = "ap-northeast-2c"
    }
  }
}

### define host name
variable "hosts" {
  default = [
### VMs in VPC-1
    "primary-101",
    "primary-102",
    "primary-103",
    "replica-101",
   "replica-102",
### VMs in VPC-2
#    "primary-201",
#    "primary-202",
#    "primary-203",
#    "replica-201",
#    "replica-202",
### extra VM in default
    "csi-aio"
  ]
}

### define role and its spec
variable "spec" {
  default = {
    Admin = {
      flavor = "t2.medium"
      root_volume_size = "160"
      additional_volume = "100"
    }
    K8s_primary = {
      flavor = "t2.medium"
      root_volume_size = "160"
      additional_volume = "50"
    }
    K8s_replica = {
      flavor = "t2.medium"
      root_volume_size = "160"
      additional_volume = "100"
    }
    Custom = {
      flavor = "t2.medium"
      root_volume_size = "50"
      additional_volume = "50"
    }
  }
}

### associate role and subnet to host
variable "host_info" {
  default = {
    primary-101 = {
      role   = "Admin"
      subnet = "public_subnet_10_0_1"
    }
    primary-102 = {
      role   = "K8s_primary"
      subnet = "public_subnet_10_0_1"
    }
    primary-103 = {
      role   = "K8s_primary"
      subnet = "public_subnet_10_0_1"
    }
    replica-101 = {
      role   = "K8s_replica"
      subnet = "public_subnet_10_0_1"
    }
    replica-102 = {
      role   = "K8s_replica"
      subnet = "public_subnet_10_0_1"
    }
    primary-201 = {
      role   = "Admin"
      subnet = "public_subnet_20_0_1"
    }
    primary-202 = {
      role   = "K8s_primary"
      subnet = "public_subnet_20_0_1"
    }
    primary-203 = {
      role   = "K8s_primary"
      subnet = "public_subnet_20_0_1"
    }
    replica-201 = {
      role   = "K8s_replica"
      subnet = "public_subnet_20_0_1"
    }
    replica-202 = {
      role   = "K8s_replica"
      subnet = "public_subnet_20_0_1"
    }
    csi-aio = {
      role   = "Custom"
      subnet = "public_subnet_10_0_1"
    }
  }
}

### Centos7 AMI ID
variable "centos7" {
  type = string
  default = "ami-00014daafdc4239f4"
}
