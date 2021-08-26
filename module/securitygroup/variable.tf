
variable "http_port" {
  default = 80
  
}

variable "https_port" {
  default = 443
  
}

variable "ssh_port" {
  default = 22
  
}

variable "tags" {
  description = "tags to propogate to all supported resources"
  type        = map(string)
}
variable "sg_name" {
  description = "the name of the security group to be created"
}
 
variable "all_cidr" {
  default = "0.0.0.0/0"
  
}