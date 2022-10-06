data "aws_ami" "amz_linux_image" {
  owners      = [var.amz_ami_owner_id]
  most_recent = true # latest
  filter {
    name   = "name"
    values = [var.amz_ami_name]
  }
}

data "aws_vpc" "vpc" {

  filter {
    name   = "tag:Name"
    values = [var.vpc_name]
  }
}

data "aws_subnet" "public_subnet_1" {

  filter {
    name   = "tag:Name"
    values = [var.public_subnet_1_name]
  }
}


