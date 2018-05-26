resource "aws_autoscaling_group" "controllers" {
  name                 = "${var.cluster_name}-controllers"
  launch_configuration = "${aws_launch_configuration.controllers.name}"
  min_size             = "${var.count}"
  max_size             = "${var.count}"
  default_cooldown     = 30
  vpc_zone_identifier  = ["${var.subnets_private}"]

  target_group_arns = ["${aws_lb_target_group.controllers.id}"]

  tag {
    key                 = "Environment"
    value               = "${var.cluster_name}"
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
  }
}
