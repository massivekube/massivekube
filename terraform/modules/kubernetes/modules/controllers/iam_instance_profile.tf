resource "aws_iam_instance_profile" "controller" {
  name_prefix = "${var.cluster_name}-controller-"
  role        = "${aws_iam_role.controller.name}"
}

resource "aws_iam_role" "controller" {
  name_prefix = "${var.cluster_name}-controller-"
  path        = "/${var.cluster_name}/"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}
