resource "aws_instance" "webserver" {
  ami           = var.ami
  key_name      = var.key_name
  instance_type = var.instance_type
  subnet_id     = aws_subnet.awslab-subnet-public.id

  root_block_device {
    volume_size = 8
  }

  vpc_security_group_ids = [
    aws_security_group.webserver.id
  ]

  depends_on = [
    aws_security_group.webserver,
    aws_instance.database
  ]

  provisioner "file" {
    source      = "${var.key_path}/${var.key_name}.pem"
    destination = "/home/${var.user}/${var.key_name}.pem"

    connection {
      type        = "ssh"
      user        = var.user
      private_key = tls_private_key.private-key.private_key_pem
      host        = aws_instance.webserver.public_ip
    }
  }

  tags = {
    Name = "awslab-webserver"
  }
}

resource "aws_instance" "database" {
  ami           = var.ami
  key_name      = var.key_name
  instance_type = var.instance_type
  subnet_id     = aws_subnet.awslab-subnet-private.id

  root_block_device {
    volume_size = 8
  }

  vpc_security_group_ids = [
    aws_security_group.database.id
  ]

  depends_on = [
    aws_security_group.database,
  ]

  tags = {
    Name = "awslab-database"
  }
}
