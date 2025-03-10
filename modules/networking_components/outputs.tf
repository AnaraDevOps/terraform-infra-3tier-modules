output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "subnet_id" {
  value = aws_subnet.public_subnet.id
}

output "sg" {
  value = aws_security_group.http_ssh_sg.id
}
