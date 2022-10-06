terraform {
  backend "s3" {
    bucket         = "ta-terraform-tfstates-041308375526"
    key            = "Sprint1/week3/projects/ec2/29.09.2022/terraform.tfstates"
    dynamodb_table = "terraform-lock"
  }
}