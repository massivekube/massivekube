resource "aws_iam_instance_profile" "bastion" {
  name_prefix = "bastion_"
  role        = "${aws_iam_role.bastion.name}"
}

resource "aws_iam_role" "bastion" {
  name_prefix = "bastion_"

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
