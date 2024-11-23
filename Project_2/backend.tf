terraform {
  backend "s3" {
    bucket         = "lytx.tfstates.actions"
    region         = "us-east-1"
    dynamodb_table = "lytx-tfstates-actions"
    key            = "terraform.tfstate"
  }
}