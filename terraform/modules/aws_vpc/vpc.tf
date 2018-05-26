resource "aws_vpc" "vpc" {
  cidr_block         = "${var.cluster_cidr}"
  enable_dns_support = true
  instance_tenancy   = "${var.instance_tenancy}"

  tags {
    Name        = "${var.cluster_name}"
    Environment = "${var.cluster_name}"
  }
}

resource "aws_vpc_dhcp_options" "dhcp_options" {
  domain_name         = "${var.cluster_name}.local kube-system.svc.${var.cluster_name}.local svc.${var.cluster_name}.local"
  domain_name_servers = ["${cidrhost(var.cluster_cidr, 2)}", "169.254.169.253"]

  tags {
    Name        = "default"
    Environment = "${var.cluster_name}"
  }
}

resource "aws_vpc_dhcp_options_association" "dhcp_options_association" {
  vpc_id          = "${aws_vpc.vpc.id}"
  dhcp_options_id = "${aws_vpc_dhcp_options.dhcp_options.id}"
}

resource "aws_internet_gateway" "gateway" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    Name        = "main"
    Environment = "${var.cluster_name}"
  }
}

resource "aws_eip" "nats" {
  count = "${var.availability_zone_count}"
  vpc   = true
}

resource "aws_nat_gateway" "gateway" {
  count         = "${var.availability_zone_count}"
  allocation_id = "${element(aws_eip.nats.*.id, count.index)}"
  subnet_id     = "${element(aws_subnet.public.*.id, count.index)}"
  depends_on    = ["aws_internet_gateway.gateway", "aws_eip.nats"]
}

resource "aws_route" "gateway" {
  route_table_id         = "${aws_vpc.vpc.default_route_table_id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.gateway.id}"
}

resource "aws_route_table" "private" {
  vpc_id = "${aws_vpc.vpc.id}"

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = "${element(aws_nat_gateway.gateway.*.id, count.index)}"
  }

  tags {
    Name        = "private"
    Environment = "${var.cluster_name}"
  }
}

resource "aws_route_table_association" "private" {
  count          = "${var.availability_zone_count}"
  subnet_id      = "${element(aws_subnet.private.*.id, count.index)}"
  route_table_id = "${aws_route_table.private.id}"
}
