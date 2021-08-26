variable "tags" {
  description = "Tags to propogate to all supported resources"
  type        = map(string)

  default = {
    Env        = "dev"
    managed-by = "Terraform"
  }
}

variable "vpc_name" {
  type        = string
  description = "Name of the VPC being deployed"
  default     = "dnb_vpc"
}


variable "subnet_name" {
  type        = string
  description = "Name of the subnet being deployed"
  default     = "dnb_subnet"
}

variable "nat_name" {
  default = "dnb_nat"
  description = "Name of the nat being deployed"
  type = string
}

variable "route_name" {
  default = "dnb_rt"
  type = string
  description = "Name of the route table to be deployed"
}
variable "sg_name" {
  default = "dnb_sg"
  type = string
  description = "Name of the SG to be created"
}

variable "ec2_name" {
  default = "dnb_ec2"
  type = string
  description = "Name of the ec2 to be created"
}
variable "s3_name" {
  default = "dnb_s3_dev"
}