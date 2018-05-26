resource "aws_lb" "controllers" {
  name               = "${var.cluster_name}-controllers"
  internal           = false
  load_balancer_type = "network"
  subnets            = ["${var.subnets_private}"]

  enable_deletion_protection = true

  tags {
    Environment = "${var.cluster_name}"
  }
}

resource "aws_lb_target_group" "controllers" {
  name     = "${var.cluster_name}-controllers"
  port     = 443
  protocol = "TCP"
  vpc_id   = "${var.vpc_id}"
}

resource "aws_lb_listener" "controllers" {
  load_balancer_arn = "${aws_lb.controllers.arn}"
  port              = "443"
  protocol          = "TCP"

  default_action {
    target_group_arn = "${aws_lb_target_group.controllers.arn}"
    type             = "forward"
  }
}
