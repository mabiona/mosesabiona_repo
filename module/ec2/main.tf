#creating IAM Roles 

resource "aws_iam_role" "dnb_iam_role" {
  name = "dnb_iam_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

#   tags = {
#       environment = var.env_var
#     }
}


#To be able to attach this role to Ec2 instance, create instance profile

resource "aws_iam_instance_profile" "dnb_profile" {
  name = "dnb_profile"
  role = "${aws_iam_role.dnb_iam_role.name}"
}

#create key-pair

resource "aws_key_pair" "dnb_keys" {
  key_name   = "dnb_keys"
  public_key = file(var.aws_key_pair)
}

# dnb ec2 instance
resource "aws_instance" "dnb_instance" {
key_name      = aws_key_pair.dnb_keys.key_name
vpc_security_group_ids = [aws_security_group.dnb_sg.id]
availability_zone =  "us-east-1a"
ami = var.ec2_ami
iam_instance_profile = "dnb_profile"
instance_type = "t2.micro"
associate_public_ip_address = true

connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = var.private_key
    host        = self.public_ip
  }



user_data = <<-EOF
#!/bin/bash
sudo yum update -y
sudo yum install httpd -y
cd /var/www/html
echo "This is a test file for dnb by Moses" > index.html
sudo chkconfig httpd on
sudo service httpd start
  EOF
  

tags = merge(
    var.tags,
    {
      "Name" = "${var.ec2_name}"
    },
  )

}
#Create frontEnd Sesurity Group
resource "aws_security_group" "dnb_sg" {
    description = "Allow TLS inbound traffic"
    #vpc_id      = aws_default_vpc.dnb_vpc.id
    #sg_id = module.securitygroup.id
    #availability_zone = "us-east-1a"

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
