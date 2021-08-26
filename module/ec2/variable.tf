
variable "aws_key_pair" {
    default = "/Users/mosesabiona/keys/dnb_keys.pub"
  
}

variable "private_key" {
  default = "/Users/mosesabiona/keys/dnb_keys"
}


variable "ec2_ami" {
  default = "ami-0c2b8ca1dad447f8a"
}


variable "tags" {
  description = "tags to propogate to all supported resources"
  type        = map(string)
}

variable "ec2_name" {
  default = "dnb_instance"
  description = "the name of the ec2 to be created"
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
 
variable "all_cidr" {
  default = "0.0.0.0/0"
  
}

