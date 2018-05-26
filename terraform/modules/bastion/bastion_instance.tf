resource "aws_instance" "bastion" {
  ami                  = "${var.bastion_ami}"
  subnet_id            = "${element(aws_subnet.public_subnets.*.id, 0)}"
  instance_type        = "${var.bastion_instance_type}"
  key_name             = "${var.ssh_key_name}"
  iam_instance_profile = "${aws_iam_instance_profile.bastion.id}"

  root_block_device {
    volume_size           = 10
    delete_on_termination = true
  }

  tags {
    Name        = "bastion"
    Envrionment = "${var.cluster_name}"
  }
}
