# XYZ Demo Infrastructure

This repository contains the [Terraform](https://www.terraform.io/) code to 
generate a Virtual Private Cloud (VPC) and Elastic Kubernetes Cluster in Amazon 
Web Services. The default region is us-east-2. State is stored in an S3 bucket 
with a locking DynamoDB table.

![Diagram](/assets/xyz-eks-diagram.jpg)

## Infrastructure

This code provsiions several resources when used. They include:
- Virtual Private Cloud (VPC)
- 3 Public Subnets
- 3 Private Subnets
- NAT Gateway
- Internet Gateway
- Elastic Kubernetes Service (EKS) Cluster
- 2 EKS Node Groups, backed by AutoScaling Groups
- Default Security Group
- Route Table for Private Subnets

The [projected infrastructure costs](https://calculator.aws/#/estimate?id=d8e78acfe95578857b86142c7dcc901e5aa3170b) 
for this workload is $133.34 per month.

## Local Usage

1. Clone the repository.
2. In AWS, create a DynamoDB table. Use `LockID ` for the partition key.
2. In AWS, create an S3 bucket to store Terraform state.
3. Modify lines 34 - 37 in `teraform.tf` to match the name of your S3 bucket and DyanmoDB table.
4. Modify the varialbes in `variables.tf` to match your region and other settings.
5. Run `terraform init` to initialize Terraform.
6. Run `terraform apply` to launch the infrastructure.
7. Run `terraform destroy` to dear down the infrastructure when you are done.
 
## GitHub Actions

Merges and pushes to the main branch of this repository will initiate a build using 
[GitHub Actions](https://github.com/features/actions). The workflow runs several 
terraform commands: `terraform init`, `terraform plan`, then `terraform apply`. 