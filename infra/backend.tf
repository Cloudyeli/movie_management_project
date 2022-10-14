terraform {
  backend "s3" {
    bucket         = "ta-terraform-tfstates-041308375526"
    key            = "project/movie_management_app/terraform.tfstates"
    dynamodb_table = "terraform-lock"
  }
}