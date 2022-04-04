terraform {
  required_version = ">= 1.0.9"

  backend "s3" {
    bucket = "awslab-cocus"
    key    = "awslab.tfstate"
    region = "us-east-1"
    profile = "default"
  }
}
