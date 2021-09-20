### PROVIDER ###

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}


provider "aws" {
  profile = "default"
  region  = "us-east-1"
}


### VARIABLES ###

variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "private_key_path" {}
variable "key_name" {}
variable "region" {
  default = "us-east-1b"
}

### 1ST RESOURCE ###

resource "aws_instance" "app_server" {
  ami           = "ami-087c17d1fe0178315"
  instance_type = "t2.micro"

  tags = {
    Name = "Rearc"
  }
}

### 2ND RESOURCE ###

resource "aws_default_vpc" "default" {

}

resource "aws_security_group" "allow_ssh" {
  name        = "docker_node"
  description = "Allow ports for docker"
  vpc_id      = "vpc-a7057fda"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

}

### 2ND RESOURCE ###
resource "aws_instance" "docker_node" {
  ami                    = "ami-087c17d1fe0178315"
  instance_type          = "t2.micro"
  key_name               = "EmekaKP-1"
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ec2-user"
    private_key = file(var.private_key_path)

  }

}

### OUTPUT ###

output "aws_instance_public_dns" {
  value = "aws_instance.docker.public_dns"
}



































