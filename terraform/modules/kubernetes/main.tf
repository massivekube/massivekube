module "controllers" {
  source = "modules/controllers"

  ami    = "asdf123"
  vpc_id = "${var.vpc_id}"

  cluster_name    = "${var.cluster_name}"
  subnets_private = "${var.subnets_private}"
  ssh_key_name    = "${var.ssh_key_name}"
}
