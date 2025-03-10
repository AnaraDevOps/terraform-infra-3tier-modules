# Create instance

resource "aws_instance" "task_ec2" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  key_name               = var.key_name
  vpc_security_group_ids = [var.sg]


  tags = {
    Name = "task-ec2"
  }
}



