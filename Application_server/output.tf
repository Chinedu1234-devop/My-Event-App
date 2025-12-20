output "instance_id" {
  description = "ID of the created EC2 instance"
  value       = aws_instance.myeventapp.id
}

output "public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.myeventapp.public_ip
}

output "public_dns" {
  description = "Public DNS of the EC2 instance"
  value       = aws_instance.myeventapp.public_dns
}

