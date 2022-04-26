module "webserver" {
  source = "./modules"
  region = var.region
  project_name = var.project_name
  instance_name = "webserver"
  subnet_type = "public"
  server_ports = [80, 80]
  subnet_cidr = "172.16.0.0/24"
  map_public_ip_on_launch = true
  vpc_id = aws_vpc.vpc.id
}

resource "aws_internet_gateway" "igw" {
  vpc_id     = aws_vpc.vpc.id
  depends_on = [aws_vpc.vpc]

  tags = {
    Name = "${var.project_name}-igw"
  }
}

resource "aws_route_table" "publicRT" {
  vpc_id = aws_vpc.vpc.id
  depends_on = [
    aws_internet_gateway.igw
  ]
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "publicRTA" {
  depends_on = [
    aws_route_table.publicRT
  ]
  subnet_id      = module.webserver.subnet_id
  route_table_id = aws_route_table.publicRT.id
}
