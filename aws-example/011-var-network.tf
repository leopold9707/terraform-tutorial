### NETWORK CONFIG ###

variable "vpc_list" {
  default = [
    {
      "vpc_name" = "vpc-1"
      "vpc_cidr" = "10.0.0.0/16"
    },
/*
    #################################################
    {
      "vpc_name" = "vpc-2"
      "vpc_cidr" = "20.0.0.0/16"
    }
    #################################################
*/
  ]
}

variable "subnet_list" {
  default = [
    {
      "subnet_name" = "subnet-1-1"
      "which_vpc"   = "vpc-1"
      "subnet_cidr" = "10.0.1.0/24"
      "subnet_az"   = "ap-northeast-2a"
    },
/*
    ####################################
    {
      "subnet_name" = "subnet-1-2"
      "which_vpc"   = "vpc-1"
      "subnet_cidr" = "10.0.2.0/24"
      "subnet_az"   = "ap-northeast-2c"
    },
    {
      "subnet_name" = "subnet-2-1"
      "which_vpc"   = "vpc-2"
      "subnet_cidr" = "20.0.1.0/24"
      "subnet_az"   = "ap-northeast-2a"
    },
    ####################################
*/
  ]
}
