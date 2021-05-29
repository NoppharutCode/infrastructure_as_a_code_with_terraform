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
  ami           = "ami-0d5eff06f840b45e9"
  instance_type = "t2.micro"
  key_name = "ec2_tu_key"
}