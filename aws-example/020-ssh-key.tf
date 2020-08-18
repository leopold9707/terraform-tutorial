# SSH KEY PAIR
resource "aws_key_pair" "terraform" {
  key_name = "terraform"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDQuFKetE00JqAGirG+cEMmkqUBmopYglOlUrUn5Xa96ZlIcmxFV/qhxymn9QbcJ88wDUIK08qflsIB+Ay4/kuEA9f/glX9uxEpxvzLK36cxtDhuuOmdDKR3+ou1D8OznbxKAOOLau0polLnHQqcxU3/9hwdPrgdAv81WSr+nbXKRm6iUfLA9NxSi0WpkI5/G0DVnaTejWst+eGqZ0O6LhFTrnGfA/PkHWzDC9yl8dC21Aap64iWRq9GaLoYCngHHnCiRSzlljLyA5+npg53p8/YAzRWzN6DddrWb4yFzQRaTqx48CBxdX7g1F+odhyIrUsq9SxDshJZJIWhm9E6e63"
#  public_key = file("~/.ssh/id_rsa.pub")
}

