terraform {
  required_version = ">= 1.0.9"

  backend "s3" {
    bucket         = "awslab-cocus"
    key            = "awslab.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}

resource "aws_s3_object" "keypair" {
  bucket = "awslab-cocus"
  key    = "${var.project_name}.pem"
  source = local_file.saveKey.filename

  depends_on = [
    local_file.saveKey
  ]
}
