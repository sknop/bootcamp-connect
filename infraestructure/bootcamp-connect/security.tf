
resource "aws_vpc" "bootcamp_connect" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "ps_bootcamp_connect"
  }
}

resource "aws_subnet" "bootcamp_connect" {
  count      = 3
  vpc_id     = aws_vpc.bootcamp_connect.id
  cidr_block = "10.0.${10+count.index}.0/24"
  availability_zone = element(var.azs, count.index)
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.ownershort}-vpc-subnet-mysql-${element(var.azs, count.index)}"
    Owner_Name = var.Owner_Name
    Owner_Email = var.Owner_Email
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.bootcamp_connect.id

  tags = {
      Name = "${var.ownershort}-vpc-gw"
      Owner_Name = var.Owner_Name
      Owner_Email = var.Owner_Email
  }
}

resource "aws_default_route_table" "bootcamp_vpc_route_table" {
  default_route_table_id = aws_vpc.bootcamp_connect.default_route_table_id

  #route {
  #  cidr_block = "10.0.0.0/16"
  #  gateway_id = aws_internet_gateway.example.id
  #}

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "${var.ownershort}-vpc-default-routing-table"
    Owner_Name = var.Owner_Name
    Owner_Email = var.Owner_Email
  }
}


#data "aws_subnet_ids" "bootcamp_connect_subnets" {
#  vpc_id = aws_vpc.bootcamp_connect.id
#}


resource "aws_security_group" "MySQL_RDS" {
  description = "MySQL RDS - Managed by Terraform"
  name = "${var.ownershort}-mysql-rds"

  vpc_id = aws_vpc.bootcamp_connect.id

   # cluster
  ingress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      self = true
  }

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    description = "mySQL access from within VPC"
    cidr_blocks = [aws_vpc.bootcamp_connect.cidr_block, "${local.myip-cidr}"]
  }


}


resource "aws_security_group" "ssh" {
  description = "Managed by Terraform"
  name = "${var.ownershort}-ssh"

  vpc_id = aws_vpc.bootcamp_connect.id

  # Allow ping from my ip and self
  ingress {
    from_port = 8
    to_port = 0
    protocol = "icmp"
    self = true
    cidr_blocks = ["${local.myip-cidr}"]
  }

  # ssh from me and self
  ingress {
      from_port = 22
      to_port = 22
      protocol = "TCP"
      self = true
      cidr_blocks = ["${local.myip-cidr}"]
  }

  # ssh from anywhere
  ingress {
      from_port = 22
      to_port = 22
      protocol = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }
}
