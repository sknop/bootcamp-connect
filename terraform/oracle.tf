resource "aws_db_instance" "oracle" {
  engine               = "oracle-ee"
  engine_version       = "19.0.0.0.ru-2021-10.rur-2021-10.r1"
  instance_class       = "db.t3.large"
  db_name              = "BOOTCAMP"
  username             = var.root-username
  password             = var.root-password
  #parameter_group_name = "default.oracle-ee-18"
  skip_final_snapshot  = true
  identifier           = "bootcamp-oracle"

  allocated_storage     = 50
  max_allocated_storage = 100
  backup_retention_period = 35

  publicly_accessible = true

  port = 1521
  storage_type = "gp2"
  tags = {
    Name = "bootcamp-oracle"
    Owner_Name = var.owner-name
    Owner_Email = var.owner-email
    description = "Oracle db  - Managed by Terraform"

  }
  multi_az               = false
  #subnet_ids             = module.vpc.database_subnets
  vpc_security_group_ids = concat(var.security-groups, aws_security_group.confluent-cloud.id)
  db_subnet_group_name    = aws_db_subnet_group.oracle_subnet_group.name
}

resource "aws_db_subnet_group" "oracle_subnet_group" {
  name       = "bootcamp-oracle"
  subnet_ids = var.subnet-ids

  tags = {
    Name = "bootcamp-oracle"
    Owner_Name = var.owner-name
    Owner_Email = var.owner-email
  }
}
