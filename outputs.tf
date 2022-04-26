output "webserver_public_ip" {
  value = module.webserver.subnet_public_ip
}

output "database_private_ip" {
  value = module.database.subnet_private_ip
}
