# Define ssh to config in instance
variable user_key {
  default = "terraform"
}


resource "aws_key_pair" "terraform" {
  key_name = "terraform"
  public_key = file("~/.ssh/id_rsa.pub")
}

