variable "aws_key_id" {
  type = string
  sensitive = true
  description = "AWS access key ID"
}

variable "aws_secret_key" {
  type = string
  sensitive = true
  description = "AWS secret key"
}

variable "aws_terraform_role_arn" {
  type = string
  description = "ARN of the role Terraform must assume"
}

variable "aws_assume_role_external_id" {
  type = string
  sensitive = true
  description = "Secret required to assume the Terraform role"
}

variable "aws_region" {
  type = string
  description = "Region to deploy to"
}

variable "availability_zones" {
  type = list(string)
  description = "List of AZs to create private and public subnets in"
}

variable "vpc_name" {
  type = string
  description = "VPC name"
}

variable "vpc_cidr_block" {
  type = string
  description = "CIDR block for the entire VPC"
}

# Good subnet CIDR calculator: https://www.davidc.net/sites/default/subnets/subnets.html

variable "public_subnet_cidr_blocks" {
  type = list(string)
  description = "List of CIDRs for the public subnets. Must have same element as AZ list. Must be compatible with VPC cidr block"
}

variable "private_subnet_cidr_blocks" {
  type = list(string)
  description = "List of CIDRs for the private subnets. Must have same element as AZ list. Must be compatible with VPC cidr block"
}