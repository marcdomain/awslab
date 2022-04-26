variable "ami" {
  type    = string
  default = "ami-0c02fb55956c7d316"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "instance_name" {
  type    = string
}

variable "region" {
  type    = string
}

variable "project_name" {
  type    = string
}

variable "server_ports" {
  type    = list(number)
}

variable "subnet_type" {
  type    = string
}

variable "subnet_cidr" {
  type = string
}

variable "tcp_cidr" {
  type = list(string)
  default = ["0.0.0.0/0"]
}

variable "map_public_ip_on_launch" {
  type = bool
  default = false
}

variable "db_server_security_groups" {
  type = list(string)
  default = []
}

variable "vpc_id" {
  type = string
}
