#data "aws_vpc" "default" {
#  default = true
#}

variable "name" {}
variable "region" {}
variable "Owner_Name" {}
variable "Owner_Email" {}
variable "ownershort" {}
variable "key_name" {}


locals {
  db_instance_address               = element(concat(aws_db_instance.default.*.endpoint, aws_db_instance.default.*.endpoint, [""]), 0)
}
