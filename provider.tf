terraform {
  # Change to your desired backend
  backend "s3" {}
}

provider "aws" {
  access_key = var.aws_key_id
  secret_key = var.aws_secret_key
  region = var.aws_region

  # can be deleted if you don't want Terraform to assume a role
  assume_role {
    role_arn = var.aws_terraform_role_arn
    external_id = var.aws_assume_role_external_id
  }

  # Change to whatever you need, or delete them
  default_tags {
    tags = {
      application = "Personal AWS VPC"
      managed_by = "Terraform"
      repository = "https://github.com/Gtomika/terraform-aws-vpc"
      owner = "Tamas Gaspar"
    }
  }
}