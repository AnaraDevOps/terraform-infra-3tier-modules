terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.18.1"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}


module "networking_components" {
  source            = "./modules/networking_components"
  vpc_cidr          = "10.0.0.0/16"
  subnet_cidr_block = "10.0.1.0/24"
}

module "ssh-key" {
  source = "./modules/ssh-key"
}

module "ec2" {
  source        = "./modules/ec2"
  ami_id        = "ami-03a6eaae9938c858c"
  instance_type = "t2.micro"
  subnet_id     = module.networking_components.subnet_id
  key_name      = module.ssh-key.key_name
  sg            = module.networking_components.sg
}

output "vpc_id" {
  value = module.networking_components.vpc_id
}

output "subnet_id" {
  value = module.networking_components.subnet_id
}

output "key_name" {
  value = module.ssh-key.key_name
}

output "instance_public_ip" {
  value = module.ec2.instance_public_ip
}

output "sg" {
  value = module.networking_components.sg
}
