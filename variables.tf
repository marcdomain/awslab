variable "region" {
  type    = string
  default = "us-east-1"
}

variable "project_name" {
  type = string
  default = "awslab"
}

variable "vpc_cidr" {
  type = string
  default = "172.16.0.0/23"
}

variable "key_path" {
  type    = string
  default = "."
}
