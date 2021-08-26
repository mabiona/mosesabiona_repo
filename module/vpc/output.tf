output "vpc_id" {
  value = aws_default_vpc.dnb_vpc.id
}

output "public_id" {
  value = "${aws_default_subnet.dnb_pub_sub_1.*.id}"  

}
  output "private_id" { 
  value = "${aws_default_subnet.dnb_prv_sub.*.id}"

}


# output "vpc_id" {
#   value = module.vpc.*.vpc_id
# }


# output "public_id" {
#   value = module.vpc.public_id
# }

# output "private_id" {
#   value = module.vpc.private_id
# }