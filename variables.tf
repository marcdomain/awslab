variable "ami" {
  default = "ami-0c02fb55956c7d316"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "region" {
  default = "us-east-1"
}

variable "key_path" {
  default = "."
}

variable "key_name" {
  default = "awslabkey"
}

variable "user" {
  default = "ec2-user"
}
