# DB Subnet Group (REQUIRED)
resource "aws_db_subnet_group" "db_subnet" {
  name = "mysql-db-subnet-group"
  subnet_ids = [
    aws_subnet.backend_private_1.id,
    aws_subnet.backend_private_2.id
  ]

  tags = {
    Name = "mysql-db-subnet-group"
  }
}

# RDS MySQL Instance
resource "aws_db_instance" "mysql" {
  identifier        = "java-app-mysql"
  engine            = "mysql"
  engine_version    = "8.0"
  instance_class    = "db.t3.micro"
  allocated_storage = 20

  db_name  = "appdb"
  username = "admin"
  password = "Password123!"

  multi_az            = true
  publicly_accessible = false
  skip_final_snapshot = true

  db_subnet_group_name = aws_db_subnet_group.db_subnet.name

  tags = {
    Name = "java-3tier-mysql"
  }
}
