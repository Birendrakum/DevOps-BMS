# get VPC details
data "aws_vpc" "main" {
  filter {
    name   = "tag:Name"
    values = ["MainServerVPC"]
  }
}

# get private subnet id
data "aws_subnet" "eks_private_a" {
  filter {
    name   = "tag:Name"
    values = ["PrivateSubnet_A"]
  }
}

data "aws_subnet" "eks_private_b" {
  filter {
    name   = "tag:Name"
    values = ["PrivateSubnet_B"]
  }
}

