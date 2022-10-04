terraform {

  cloud {
    organization = "ottokorp"
    workspaces {
      name = "learn-tfc-aws"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "ap-southeast-2"
}

resource "aws_instance" "app_server" {
  ami                    = "ami-00189b0cfffba54bb"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["sg-0309088508b70b6a0"]
  subnet_id              = "subnet-025ec875d1fb1af29"
  tags = {
    Name = var.instance_name
  }
}
