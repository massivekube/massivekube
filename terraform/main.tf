module "aws_vpc" {
  source = "modules/aws_vpc"

  cluster_name = "development"
  cluster_cidr = "10.1.0.0/16"
}

module "kubernetes" {
  source = "modules/kubernetes"

  vpc_id       = "${module.aws_vpc.vpc_id}"
  cluster_name = "development"
  cluster_cidr = "10.1.0.0/16"

  subnets_private = "${module.aws_vpc.subnets_private}"
}
