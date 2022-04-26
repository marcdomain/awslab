resource "aws_security_group" "sg" {
  vpc_id      = var.vpc_id
  name        = var.instance_name
  description = "Allows inbound and outbound traffic"

  ingress {
    from_port   = element(var.server_ports, 0)
    to_port     = element(var.server_ports, 1)
    protocol    = "tcp"
    cidr_blocks = var.tcp_cidr
    security_groups = var.db_server_security_groups
    description = "Allows TCP connection"
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allows pinging"
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.tcp_cidr
    description = "Allows SSH connection"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  depends_on = [
    var.vpc_id
    # aws_vpc.vpc
  ]

  tags = {
    Name = var.instance_name
  }
}
