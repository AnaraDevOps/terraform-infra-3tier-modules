resource "aws_key_pair" "ssh-key" {
  key_name   = "ssh-key"
  public_key = file("~/.ssh/23C-key.pub")
}

variable "ssh-key" {
  type    = string
  default = "ssh-key"
}
