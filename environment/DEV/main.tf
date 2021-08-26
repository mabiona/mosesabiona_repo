module "ec2" {
   source   = "../../module/ec2/"
   ec2_name = var.ec2_name
   sg_name = var.sg_name
   tags     = var.tags

}

module "vpc" {
    source = "../../module/vpc/"
     subnet_name = var.subnet_name
     nat_name = var.nat_name
    route_name = var.route_name
    vpc_name = var.vpc_name
    sg_name = var.sg_name
    tags     = var.tags

}

module "s3_dev" {
    source = "../../module/s3_dev/"
    
}
