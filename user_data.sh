#!/bin/sh
sudo yum update -y
sudo yum install httpd -y
sudo systemctl start httpd