provider "aws" {
  region = "us-east-1"
}

module "my_vpc" {
  source      = "../modules/vpc"
  vpc_cidr    = "172.31.0.0/16"
  tenancy     = "default"
  vpc_id      = "${var.vpc_id}"
  subnet_cidr = "${var.subnet_cidr}"
}

module "my_ec2" {
  source        = "../modules/ec2"
  ec2_count     = "${var.ec2_count}"
  ami_id        = "${var.ami_id}"
  instance_type = "${var.instance_type}"
  subnet_id     = "${module.my_vpc.subnet_id}"
}
