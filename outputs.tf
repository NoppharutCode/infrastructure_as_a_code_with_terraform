output "instance_id" {
    description = "ID of the EC2 instance"
    value       = aws_instance.example_instance.id
}

output "public_ip" {
    description = "public ip of the EC2 instance"
    value       = aws_instance.example_instance.public_ip
}