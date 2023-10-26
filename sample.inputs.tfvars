aws_key_id = "<your access key>"
aws_secret_key = "<your secret key>"

# can be deleted if you don't assume role with Terraform
aws_terraform_role_arn = "<your role ARN for Terraform>"
aws_assume_role_external_id = "<your role external ID>"

# can be changed to the desired region and AZs
aws_region = "eu-central-1"
availability_zones = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]

# name and CIDR blocks can be freely changed
# just make sure they are valid and there is one for each AZ
vpc_name = "Personal VPC"
vpc_cidr_block = "10.0.0.0/18"
public_subnet_cidr_blocks = ["10.0.0.0/21", "10.0.8.0/21", "10.0.16.0/21"]
private_subnet_cidr_blocks = ["10.0.24.0/21", "10.0.32.0/21", "10.0.40.0/21"]