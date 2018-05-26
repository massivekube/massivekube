variable "vpc_id" {}

variable "count" {
  default = 3
}

variable "cluster_name" {}

variable "ami" {}

variable "ssh_key_name" {}

variable "instance_type" {
  default = "m4.large"
}

variable "root_disk_size" {
  default = 32
}

variable "var_log_disk_size" {
  default = 32
}

variable "tmp_disk_size" {
  default = 32
}

variable "subnets_private" {
  type = "list"
}
