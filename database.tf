module "database" {
  source = "./modules"
  region = var.region
  project_name = var.project_name
  instance_name = "database"
  subnet_type = "private"
  server_ports = [3110, 3110]
  subnet_cidr = "172.16.1.0/24"
  tcp_cidr = ["172.16.1.0/24"]
  db_server_security_groups = [module.webserver.sg_id]
  vpc_id = aws_vpc.vpc.id
  depends_on = [
    module.webserver.subnet_id
  ]
}
