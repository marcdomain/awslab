resource "aws_vpc" "awslab-vpc" {
  cidr_block           = "172.16.0.0/23"
  instance_tenancy     = "default"
  enable_dns_hostnames = true

  tags = {
    Name = "awslab-vpc"
  }
}

resource "aws_subnet" "awslab-subnet-public" {
  vpc_id                  = aws_vpc.awslab-vpc.id
  cidr_block              = "172.16.0.0/24"
  depends_on              = [aws_vpc.awslab-vpc]
  map_public_ip_on_launch = "true"
  availability_zone       = "${var.region}a"

  tags = {
    Name = "awslab-subnet-public"
  }
}

resource "aws_subnet" "awslab-subnet-private" {
  vpc_id                  = aws_vpc.awslab-vpc.id
  cidr_block              = "172.16.1.0/24"
  depends_on              = [aws_vpc.awslab-vpc]
  map_public_ip_on_launch = "false"
  availability_zone       = "${var.region}a"

  tags = {
    Name = "awslab-subnet-private"
  }
}
