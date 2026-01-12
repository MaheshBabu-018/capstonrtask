output "frontend_vpc" {
  value = aws_vpc.frontend_vpc.id
}

output "database_endpoint" {
  value = aws_db_instance.mysql.endpoint
}
