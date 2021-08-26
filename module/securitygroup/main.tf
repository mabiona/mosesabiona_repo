#Create frontEnd Sesurity Group
resource "aws_security_group" "dnb_sg" {
    description = "Allow TLS inbound traffic"
    vpc_id      = aws_default_vpc.dnb_vpc.id
    sg_id = module.securitygroup.id
    availability_zone = "us-east-1a"

    ingress {
    description = "http rule"
    from_port   = var.http_port
    to_port     = var.http_port
    protocol    = "tcp"
    cidr_blocks = [var.all_cidr]
  }
  ingress {
    description = "https rule"
    from_port   = var.https_port
    to_port     = var.https_port
    protocol    = "tcp"
    cidr_blocks = [var.all_cidr]
  }

  ingress {
    description = "ssh rule"
    from_port   = var.ssh_port
    to_port     = var.ssh_port
    protocol    = "tcp"
    cidr_blocks = [var.all_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.all_cidr]
  }

tags = merge(
    var.tags,
    {
      "Name" = "${var.sg_name}"
    },
  )
}