# DEFINING ALL VARIABLES
variable "ubuntu_ami_owner_id" {
  description = "Contains the Owner ID of the ami for amazon linux"
  type        = string
}

variable "ubuntu_ami_name" {
  description = "Name of the ami I want for my project"
  type        = string
}

variable "vpc_name" {
  description = "ID of the VPC instance"
  type        = string
}

variable "public_subnet_1_name" {
  description = "The name of my Public Subnet 1"
  type        = string
}

variable "private_subnet_1_name" {
  description = "The name of my Private Subnet 1"
  type        = string
}

variable "private_subnet_2_name" {
  description = "The name of my Private Subnet 2"
  type        = string
}

variable "movie_app_ec2_type" {
  description = "The type of the EC2 instance for movie app"
  type        = string
}

variable "keypair_name" {}

variable "db_storage" {
  description = "Size of the disk for the Database"
}

variable "db_name" {
  description = "Name of the Database"
}

variable "db_engine" {
  description = "The DB engine to run our RDS"
}

variable "db_envine_version" {
  description = "The version of the db engine"
}

variable "db_instance_class" {
  description = "Instance Type for the DB"
}

variable "db_username" {
  description = "Username to connect to the DB"
}

variable "db_skip_last_snapshop" {
  description = "Take a snapshot before destroying the DB"
  default     = true
}