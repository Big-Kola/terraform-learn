output "ec2_public_ip" {
  value = module.myapp-server.public_ip
  description = "Public IP of myapp-server from the module"
}