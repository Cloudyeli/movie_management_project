# DEFINING ALL VARIABLES
variable "amz_ami_owner_id" {
  description = "Contains the Owner ID of the ami for amazon linux"
  type        = string
}

variable "amz_ami_name" {
  description = "Name of the ami I want for my project"
  type        = string
}

variable "vpc_name" {
  description = "ID of the VPC instance"
  type        = string
}

variable "public_subnet_1_name" {
  description = "The name if my Public Subnet 1"
  type        = string
}

variable "movie_app_ec2_type" {
  description = "The type of the EC2 instance for movie app"
  type        = string
}

variable "keypair_name" {}
