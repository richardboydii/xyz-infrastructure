# Modify variables as needed. By default the cluster and vpc will be 
# provisioned in us-east-1 with a 172 base CIDR.

variable "region" {
  description = "AWS region"
  type        = string
  default = "us-east-1"
}

variable "vpc_name" {
  description = "VPC Name"
  type        = string
  default = "xyz-vpc"
}

variable "vpc_cidr" {
  description = "CIDR Block for VPC"
  type = string
  default = "172.16.0.0/16"
}

variable "pub_sub_cidrs" {
  description = "CIDR Blocks for Public Subnets"
  type = list(string)
  default = ["172.16.1.0/24", "172.16.2.0/24", "172.16.3.0/24"]
}

variable "priv_sub_cidrs" {
  description = "CIDR Blocks for Private Subnets"
  type = list(string)
  default = ["172.16.4.0/24", "172.16.5.0/24", "172.16.6.0/24"]
}
