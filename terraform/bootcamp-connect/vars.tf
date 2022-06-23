#data "aws_vpc" "default" {
#  default = true
#}

variable "name" {}
variable "region" {}
variable "Owner_Name" {}
variable "Owner_Email" {}
variable "ownershort" {}
variable "key_name" {}

variable "root_username" {}
variable "root_password" {}

locals {
  db_instance_address               = element(concat(aws_db_instance.default.*.endpoint, aws_db_instance.default.*.endpoint, [""]), 0)
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}
