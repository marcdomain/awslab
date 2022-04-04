resource "tls_private_key" "private-key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "keypair" {
  key_name   = var.key_name
  public_key = tls_private_key.private-key.public_key_openssh
  depends_on = [tls_private_key.private-key]
}

resource "local_file" "saveKey" {
  content         = tls_private_key.private-key.private_key_pem
  filename        = "${var.key_path}/${var.key_name}.pem"
  file_permission = 400
}
