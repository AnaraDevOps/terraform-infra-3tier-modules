output "instance_public_ip" {
  value = aws_instance.task_ec2.public_ip
}
