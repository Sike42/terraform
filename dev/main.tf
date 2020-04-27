provider "aws" {
  region = "us-east-2"
}

module "my_vpc" {
  source      = "../modules/vpc"
  vpc_cidr    = "172.31.0.0/16"
  tenancy     = "default"
  vpc_id      = "vpc-c8c617a3"
  subnet_cidr = "172.31.16.0/32"
}

module "my_ec2" {
  source        = "../modules/ec2"
  ami_id        = "${var.ami_id}"
  instance_type = "${var.instance_type}"
  subnet_id     = "${module.my_vpc.subnet_id}"
}


