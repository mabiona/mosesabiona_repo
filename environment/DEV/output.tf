output "vpc_id" {
  value = module.vpc.vpc_id
}


output "public_id" {
  value = module.vpc.public_id
}

output "private_id" {
  value = module.vpc.private_id
}

output "public_ec2_ip" {
  value = module.ec2.public_ec2_ip
}