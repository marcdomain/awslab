
resource "aws_internet_gateway" "awslab-igw" {
  vpc_id     = aws_vpc.awslab-vpc.id
  depends_on = [aws_vpc.awslab-vpc]

  tags = {
    Name = "awslab-igw"
  }
}

resource "aws_route_table" "awslab-publicRT" {
  vpc_id = aws_vpc.awslab-vpc.id
  depends_on = [
    aws_vpc.awslab-vpc,
    aws_internet_gateway.awslab-igw
  ]
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.awslab-igw.id
  }
}

resource "aws_route_table_association" "awslab-publicRTA" {
  depends_on = [
    aws_subnet.awslab-subnet-public,
    aws_route_table.awslab-publicRT
  ]
  subnet_id      = aws_subnet.awslab-subnet-public.id
  route_table_id = aws_route_table.awslab-publicRT.id
}
