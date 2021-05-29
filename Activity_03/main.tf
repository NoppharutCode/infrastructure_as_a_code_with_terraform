terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.42.0"
    }
  }
}


# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

resource "aws_key_pair" "ec2_tu_key" {
  key_name   = "ec2_tu_key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDDw+bZLwsLYmDjXcgvkq5Kyi2j8EQTGFWNVn+hiGcPO7QDSDXJytWMuyCR5roKj9kWI6EuGKM/NTLmcaNiOFQa7SOMktqykEwvXRhU+SuSEY1k0QnuTAtvHhSoKCt7VXaWXsyvXLipjys6/CXAeZiBbi1AfOjDb6q/4YBDDXhm3eD3ZCk3+7Xac6zAGgLLiKXT8ZLbh9LNkZEcLXX3fpwIrT+t7DXV0s0GF1dfJu0xnWjKEmrR7di6AeuPmiYstP7mKuH+/2WtxRY+T46KY/xGEtC6+725NKOXK8gdgvbmj3UpdPOiPxlMpDH2aqCAfd7lCUgBsZf2jS7FY2oZmLYjrFxIS14gmNjJoclDIvVtj71MuYcQ6AqO3G9gX15l1ytxp9ZLQW9HtUOL1OQNgBCpStzGtsm94EGTxZ5D9pyHAvfNZmXnuEMYpOg7QKxCsaetYOHOqRKczfgwBKtrlMQP7ClDsBW3YJTpiMN4vaaFUeTMwtPdJTkefe7TfH8lCFc= User@DESKTOP-7L3R2DF"
}

resource "aws_instance" "example_instance" {
  ami           = var.ami
  instance_type = "t2.micro"
  key_name = aws_key_pair.ec2_tu_key.key_name 
  vpc_security_group_ids = [
    aws_security_group.tu_security_group.id
  ]
  tags = var.tags
}


resource "aws_security_group" "tu_security_group" {
  name        = var.security_name
  description = "Allow SSH inbound traffic"

  ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = var.tags
}