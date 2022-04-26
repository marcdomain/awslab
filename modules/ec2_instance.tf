resource "aws_instance" "server" {
  ami           = var.ami
  key_name      = var.project_name
  instance_type = var.instance_type
  subnet_id     = aws_subnet.subnet.id
  user_data     = file("user_data.sh")

  root_block_device {
    volume_size = 8
  }

  vpc_security_group_ids = [
    aws_security_group.sg.id
  ]

  depends_on = [
    aws_security_group.sg
  ]

  tags = {
    Name = var.instance_name
  }
}
