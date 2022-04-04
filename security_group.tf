resource "aws_security_group" "webserver" {
  vpc_id      = aws_vpc.awslab-vpc.id
  name        = "awslab-webserver-sg"
  description = "Allows webserver inbound traffic"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allows HTTP connection"
  }

  ingress {
    from_port      = -1
    to_port        = -1
    protocol       = "icmp"
    cidr_blocks    = ["0.0.0.0/0"]
    description = "Allows pinging"
  }

  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description     = "Allows SSH connection"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  depends_on = [
    aws_vpc.awslab-vpc
  ]

  tags = {
    Name = "awslab-webserver"
  }
}

resource "aws_security_group" "database" {
  vpc_id      = aws_vpc.awslab-vpc.id
  name        = "awslab-database-sg"
  description = "Allows database inbound traffic"

  ingress {
    from_port   = 3110
    to_port     = 3110
    protocol    = "tcp"
    cidr_blocks = ["172.16.1.0/24"]
    security_groups = [aws_security_group.webserver.id]
    description = "Allow TCP"
  }

  ingress {
    from_port      = -1
    to_port        = -1
    protocol       = "icmp"
    cidr_blocks    = ["0.0.0.0/0"]
    description = "Allows pinging"
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["172.16.1.0/24"]
    security_groups = [aws_security_group.webserver.id]
    description = "Allows SSH"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  depends_on = [
    aws_vpc.awslab-vpc
  ]

  tags = {
    Name = "awslab-database"
  }
}
