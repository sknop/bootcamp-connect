// Copyright 2023 Sven Erik Knop sven@confluent.io
// All rights reserved

// MySQL instance

resource "aws_instance" "mysql" {
  ami     = data.aws_ami.ubuntu.id
  instance_type = var.mysql-instance-type
  key_name = var.key-name

  root_block_device {
    volume_size = 50
  }

  tags = {
    Name = "mysql"
    description = "MySQL Node - Managed by Terraform"
    Schedule = "zookeeper-mon-8am-fri-6pm"
  }

  subnet_id = var.subnet-ids[1]
  availability_zone = var.availability-zones[1]
  vpc_security_group_ids = concat(var.security-groups, aws_security_group.confluent-cloud.id)
  associate_public_ip_address = true
}

resource "aws_eip" "mysql" {
  instance  = aws_instance.mysql.id
  domain    = "vpc"
}

resource "aws_route53_record" "mysql" {
  count = 1
  allow_overwrite = true
  zone_id = var.hosted-zone-id
  name = "mysql"
  type = "A"
  ttl = "300"
  records = [aws_instance.mysql.private_ip]
}

// PostgreSQL instance

resource "aws_instance" "postgres" {
  ami     = data.aws_ami.ubuntu.id
  instance_type = var.mysql-instance-type
  key_name = var.key-name

  root_block_device {
    volume_size = 50
  }

  tags = {
    Name = "postgres"
    description = "PostgreSQL Node - Managed by Terraform"
    Schedule = "zookeeper-mon-8am-fri-6pm"
  }

  subnet_id = var.subnet-ids[1]
  availability_zone = var.availability-zones[1]
  vpc_security_group_ids = concat(var.security-groups, aws_security_group.confluent-cloud.id)
  associate_public_ip_address = true
}

resource "aws_eip" "postgres" {
  instance  = aws_instance.postgres.id
  domain    = "vpc"
}

resource "aws_route53_record" "postgres" {
  count = 1
  allow_overwrite = true
  zone_id = var.hosted-zone-id
  name = "postgres"
  type = "A"
  ttl = "300"
  records = [aws_instance.postgres.private_ip]
}

// ElasticSearch instance

resource "aws_instance" "elastic" {
  count = 3
  ami     = data.aws_ami.ubuntu.id
  instance_type = var.elastic-instance-type
  key_name = var.key-name

  root_block_device {
    volume_size = 50
  }

  tags = {
    Name = "elastic"
    description = "Elastic Node - Managed by Terraform"
    Schedule = "zookeeper-mon-8am-fri-6pm"
  }

  subnet_id = var.subnet-ids[count.index % length(var.subnet-ids)]
  availability_zone = var.availability-zones[count.index % length(var.availability-zones)]
  vpc_security_group_ids = concat(var.security-groups, aws_security_group.confluent-cloud.id)
  associate_public_ip_address = true
}

resource "aws_route53_record" "elastic" {
  count = 3
  allow_overwrite = true
  zone_id = var.hosted-zone-id
  name = "elastic-${count.index}"
  type = "A"
  ttl = "300"
  records = [element(aws_instance.elastic.*.private_ip, count.index)]
}
