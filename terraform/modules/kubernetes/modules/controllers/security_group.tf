resource "aws_security_group" "controllers" {
  name        = "${var.cluster_name}-controllers"
  description = "Kubernetes Controller Security Group"
  vpc_id      = "${var.vpc_id}"

  tags {
    Name        = "Kubernetes controllers"
    Environment = "${var.cluster_name}"
  }
}
