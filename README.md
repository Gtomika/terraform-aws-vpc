# AWS VPC with Terraform

This repository contains Terraform code that sets up a most basic AWS VPC. This VPC contains some public 
and private subnets. I use it in other projects and it is extracted here as a common component.

This simple setup is free on AWS.

## How to use

Create an `inputs.tfvars` file where you fill the required values. `sample.inputs.tfvars` can be used as a start.

Initialize Terraform. This is for an S3 backend, but it can be adjusted for other backend types with ease.

```
terraform init \
  -backend-config="<your S3 state bucket>" \
  -backend-config="key=<your state file S3 key>" \
  -backend-config="region=<your AWS region>" \
  -backend-config="access_key=<AWS access key for Terraform to use>" \
  -backend-config="secret_key=<AWS secret key for Terraform to use>"
```

Plan configuration:

```
terraform plan --var-file=inputs.tfvars --out=vpc.tfplan
```

Apply configuration:

```
terraform apply vpc.tfplan
```

In case destroying this infrastructure is needed:

```
terraform destroy --var-file=inputs.tfvars
```

It will ask for confirmation.