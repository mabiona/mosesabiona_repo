variable "tags" {
  description = "tags to propogate to all supported resources"
  type        = map(string)
}

variable "vpc_name" {
  description = "name of the VPC to create"
}

variable "availability_zone_1" {
  default = "us-east-1a"
  
}

variable "availability_zone_2" {
  default = "us-east-1b"
  
}

variable "all_cidr" {
  default = "0.0.0.0/0"
  
}



variable "subnet_name" {
  description = "name of the subnet to create"
}
variable "nat_name" {
  description = "name of the natgateway to be created"
}

variable "route_name" {
  description = "name of the route table to be created"
}


variable "http_port" {
  default = 80
  
}

variable "https_port" {
  default = 443
  
}

variable "ssh_port" {
  default = 22
  
}

variable "sg_name" {
  description = "the name of the security group to be created"
}