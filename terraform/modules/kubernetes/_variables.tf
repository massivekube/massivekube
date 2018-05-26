variable "cluster_name" {}
variable "cluster_cidr" {}

variable "vpc_id" {}

variable "availability_zone_count" {
  default = 3
}

variable "subnets_private" {
  type = "list"
}

variable "subnets_public" {
  type    = "list"
  default = []
}

variable "ssh_key_name" {
  default = "default"
}
