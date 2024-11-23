terraform {
  backend "s3" {
    bucket         = "iyad-home-lab"
    region         = "us-east-1"
    dynamodb_table = "iyad-home-lab"
    key            = "terraform.tfstate"
  }
}