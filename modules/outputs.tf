output "subnet_public_ip" {
  value = aws_instance.server.public_ip
}

output "subnet_private_ip" {
  value = aws_instance.server.private_ip
}

output "subnet_id" {
  value = aws_subnet.subnet.id
}

output "sg_id" {
  value = aws_security_group.sg.id
}
