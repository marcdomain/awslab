output "awslab-subnet-public-ip" {
  value = aws_instance.webserver.public_ip
}

output "awslab-subnet-private-ip" {
  value = aws_instance.database.private_ip
}
