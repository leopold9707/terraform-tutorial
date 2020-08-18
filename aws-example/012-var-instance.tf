### INSTANCE CONFIG ###

variable instance_list {
  default = [
    {
      "vm-name" = "primary-101"
      "flavor" = "t2.medium"
      "root_volume_size" = "100"
      "additional_volume" = "50"
      "subnet_name" = "subnet-1-1"
    },
    {
      "vm-name" = "primary-102"
      "flavor" = "t2.medium"
      "root_volume_size" = "100"
      "additional_volume" = "50"
      "subnet_name" = "subnet-1-1"
    },
    {
      "vm-name" = "primary-103"
      "flavor" = "t2.medium"
      "root_volume_size" = "100"
      "additional_volume" = "50"
      "subnet_name" = "subnet-1-1"
    },
    {
      "vm-name" = "primary-104"
      "flavor" = "t2.medium"
      "root_volume_size" = "100"
      "additional_volume" = "50"
      "subnet_name" = "subnet-1-1"
    },
    {
      "vm-name" = "primary-105"
      "flavor" = "t2.medium"
      "root_volume_size" = "100"
      "additional_volume" = "50"
      "subnet_name" = "subnet-1-1"
    },
#################################
/*
    {
      "vm-name" = "primary-201"
      "flavor" = "t2.medium"
      "root_volume_size" = "100"
      "additional_volume" = "50"
      "subnet_name" = "subnet-2-1"
    }
*/
#################################
  ]
}
