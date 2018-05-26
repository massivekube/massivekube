resource "aws_subnet" "public" {
  count      = "${var.availability_zone_count}"
  vpc_id     = "${aws_vpc.vpc.id}"
  cidr_block = "${cidrsubnet(var.cluster_cidr, 8, count.index + 1)}"

  availability_zone = "${data.aws_availability_zones.available.names[count.index]}"

  tags {
    Name        = "public-${count.index + 1}"
    Environment = "${var.cluster_name}"
  }
}

resource "aws_subnet" "private" {
  count             = "${var.availability_zone_count}"
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${cidrsubnet(var.cluster_cidr, 6, count.index + 1)}"
  availability_zone = "${data.aws_availability_zones.available.names[count.index]}"

  tags {
    Name        = "private-${count.index + 1}"
    Environment = "${var.cluster_name}"
  }
}
