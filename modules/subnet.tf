resource "aws_subnet" "subnet" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.subnet_cidr
  depends_on              = [var.vpc_id]
  # depends_on              = [aws_vpc.vpc]
  map_public_ip_on_launch = var.map_public_ip_on_launch
  availability_zone       = "${var.region}a"

  tags = {
    Name = "${var.project_name}-subnet-${var.subnet_type}"
  }
}
