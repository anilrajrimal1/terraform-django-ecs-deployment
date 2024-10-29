output "app_url" {
  description = "Endpoint of Load Balancer"
  value       = aws_lb.application_load_balancer.dns_name
}

output "rds_endpoint" {
  description = "The endpoint of the RDS database"
  value       = aws_db_instance.my_db.address
}

output "vpc" {
  description = "VPC"
  value       = aws_vpc.vpc1.id
}