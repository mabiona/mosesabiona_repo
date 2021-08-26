output "public_ec2_ip" {
  value = aws_instance.dnb_instance.public_ip
}