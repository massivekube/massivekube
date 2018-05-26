variable "cluster_name" {}
variable "cluster_cidr" {}

variable "availability_zone_count" {
  default = 3
}

variable "instance_tenancy" {
  default = "default"
}

data "aws_availability_zones" "available" {}
