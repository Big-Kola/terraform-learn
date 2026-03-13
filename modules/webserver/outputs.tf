output "instance" {
    value = aws_instance.myapp-server
}

output "public_ip" {
  value = aws_instance.myapp-server.public_ip
  description = "Public IP of the EC2 instance"
}