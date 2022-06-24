resource "aws_db_instance" "mysql" {
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.large"
  db_name              = "mydb"
  username             = var.root-username
  password             = var.root-password
  parameter_group_name = aws_db_parameter_group.mysql.name #"default.mysql5.7"
  skip_final_snapshot  = true
  identifier           = "bootcamp-mysql"

  allocated_storage     = 50
  max_allocated_storage = 100

  publicly_accessible = true
  backup_retention_period = 35

  port = 3306
  storage_type = "gp2"

  tags = {
    Name = "bootcamp-mysql"
    Owner_Name = var.owner-name
    Owner_Email = var.owner-email
    description = "MySQL db  - Managed by Terraform"

  }

  multi_az               = true
  #subnet_ids             = module.vpc.database_subnets
  vpc_security_group_ids = var.security-groups
  db_subnet_group_name    = aws_db_subnet_group.mysql_subnet_group.name

}

resource "aws_db_parameter_group" "mysql" {
  name   = "bootcamp-mysql57"
  family = "mysql5.7"

  parameter {
    name  = "binlog_format"
    value = "ROW"
  }
}

resource "aws_db_subnet_group" "mysql_subnet_group" {
  name       = "bootcamp-mysql"
  subnet_ids = var.subnet-ids

  tags = {
    Name = "bootcamp-mysql"
    Owner_Name = var.owner-name
    Owner_Email = var.owner-email
  }
}
