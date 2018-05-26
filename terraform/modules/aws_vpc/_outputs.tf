output "vpc_id" {
  value = "${aws_vpc.vpc.id}"
}

output "subnets_public" {
  value = ["${aws_subnet.public.*.id}"]
}

output "subnets_private" {
  value = ["${aws_subnet.private.*.id}"]
}
