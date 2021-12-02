resource "aws_db_instance" "default" {
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  name                 = "mydb"
  username             = var.root_username
  password             = var.root_password
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  identifier           = "${var.ownershort}-mysql"

  allocated_storage     = 50
  max_allocated_storage = 100

  publicly_accessible = true

  port = 3306
  storage_type = "gp2"
  tags = {
    Name = "${var.ownershort}-mysql"
    Owner_Name = var.Owner_Name
    Owner_Email = var.Owner_Email
    description = "MySQL db  - Managed by Terraform"

  }
  multi_az               = true
  #subnet_ids             = module.vpc.database_subnets
  vpc_security_group_ids = [aws_security_group.MySQL_RDS.id]
  db_subnet_group_name    = aws_db_subnet_group.aurora_subnet_group.name

}

resource "aws_db_instance" "oracle" {
  engine               = "oracle-ee"
  engine_version       = "12.1.0.2.v8"
  instance_class       = "db.t3.large"
  name                 = "myoracle"
  username             = var.root_username
  password             = var.root_password
  #parameter_group_name = "default.oracle-ee-18"
  skip_final_snapshot  = true
  identifier           = "${var.ownershort}-oracle"

  allocated_storage     = 50
  max_allocated_storage = 100

  publicly_accessible = true

  port = 1521
  storage_type = "gp2"
  tags = {
    Name = "${var.ownershort}-oracle"
    Owner_Name = var.Owner_Name
    Owner_Email = var.Owner_Email
    description = "Oracle db  - Managed by Terraform"

  }
  multi_az               = false
  #subnet_ids             = module.vpc.database_subnets
  vpc_security_group_ids = [aws_security_group.Oracle_RDS.id]
  db_subnet_group_name    = aws_db_subnet_group.aurora_subnet_group.name
}

locals {
  subnet_ids = [for subnet in aws_subnet.bootcamp_connect: subnet.id]
}

resource "aws_db_subnet_group" "aurora_subnet_group" {
  name       = "tf-rds-mysql"
  subnet_ids = local.subnet_ids

  tags = {
    Name = "${var.ownershort}-tf-rds-mysql"
    Owner_Name = var.Owner_Name
    Owner_Email = var.Owner_Email
  }
}
