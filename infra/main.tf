data "aws_ami" "ubuntu_image" {
  owners      = [var.ubuntu_ami_owner_id]
  most_recent = true # latest
  filter {
    name   = "name"
    values = [var.ubuntu_ami_name]
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

data "aws_subnet" "private_subnet_1" {

  filter {
    name   = "tag:Name"
    values = [var.private_subnet_1_name]
  }
}

data "aws_subnet" "private_subnet_2" {

  filter {
    name   = "tag:Name"
    values = [var.private_subnet_2_name]
  }
}

# GET DB PASSWORD
data "aws_secretsmanager_secret" "movie_db_secret" {
  name = "movie-db-password"
}

data "aws_secretsmanager_secret_version" "movie-db-pw" {
  secret_id = data.aws_secretsmanager_secret.movie_db_secret.id
}