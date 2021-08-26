# provisioning of aws default vpc
resource "aws_default_vpc" "dnb_vpc" {
  enable_dns_support   = true
  enable_dns_hostnames = true


tags = merge(
    var.tags,
    {
      "Name" = var.vpc_name
    },
  )
}


# provisoning first public  subnet
resource "aws_default_subnet" "dnb_pub_sub_1" {
  availability_zone = var.availability_zone_1
  map_public_ip_on_launch = true
  tags = merge(
    var.tags,
    {
      "Name" = "${var.subnet_name}-public"
    },
  )
}






# # provisoning  one private  subnet
resource "aws_default_subnet" "dnb_prv_sub" {
  availability_zone = var.availability_zone_2
  map_public_ip_on_launch = true
tags = merge(
    var.tags,
    {
      "Name" = "${var.subnet_name}-private"
    },
  )
}


# variable "vpc_id" {}

# data "aws_internet_gateway" "dnb_igw" {
#   #vpc_id = aws_default_vpc.dnb_vpc.id

#    filter {
#     name   = "dnb_vpc"
#     values = ["aws_default_vpc.dnb_vpc"]
#   }

#   tags = {
#     Name = "dnb_igw"
#   }
# }

# # elastic ip for natgateway
resource "aws_eip" "dnb_nat_eip" {
  vpc      = true

}

# # Natgate way provioned
resource "aws_nat_gateway" "dnb_nat" {
  allocation_id = aws_eip.dnb_nat_eip.id
  subnet_id     = aws_default_subnet.dnb_pub_sub_1.id

tags = merge(
    var.tags,
    {
      "Name" = "${var.nat_name}"
    },
  )
}

# # provisioning pub route table
resource "aws_route_table" "dnb_rt-pub" {
  vpc_id = aws_default_vpc.dnb_vpc.id
  
 


 tags = merge(
    var.tags,
    {
      "Name" = "${var.route_name}-pub"
    },
  )
}


# # provisioning private route table
resource "aws_route_table" "dnb_rt-prv" {
  vpc_id = aws_default_vpc.dnb_vpc.id
    route {
    cidr_block = var.all_cidr
    gateway_id = aws_nat_gateway.dnb_nat.id
  }

 tags = merge(
    var.tags,
    {
      "Name" = "${var.route_name}-prv"
    },
  )
   
}

# #Route table Association

resource "aws_route_table_association" "dnb_pub_rt_association_1" {
  subnet_id      = aws_default_subnet.dnb_pub_sub_1.id
  route_table_id = aws_route_table.dnb_rt-pub.id
}



resource "aws_route_table_association" "dnb_prv_rt_association" {
  subnet_id      = aws_default_subnet.dnb_prv_sub.id
  route_table_id = aws_route_table.dnb_rt-prv.id
}

#Create frontEnd Sesurity Group
resource "aws_security_group" "dnb_sg" {
    description = "Allow TLS inbound traffic"
    vpc_id      = aws_default_vpc.dnb_vpc.id


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