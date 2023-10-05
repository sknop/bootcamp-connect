variable "region" {
  type = string
}

variable "vpc-id" {
  type = string
}

variable "key-name" {
  type = string
}

variable "private-key" {
  description = "Absolute path to the private key"
  type = string
}

variable "mysql-instance-type" {
  type = string
  default = "m5.large"
}

variable "oracle-instance-type" {
  type = string
  default = "m5.large"
}

variable "elastic-instance-type" {
  type = string
  default = "m5.large"
}

variable subnet-ids {
  type = list(string)
}

variable "availability-zones" {
  type = list(string)
}

variable security-groups {
  type = list(string)
}

variable owner-name {
  type = string
  default = "Sven Erik Knop"
}

variable owner-email {
  type = string
  default = "sven@confluent.io"
}

variable hosted-zone-id {
  type = string
}

variable root-username {
  default = "admin"
}

variable root-password {
  default = "adminsecret"
  sensitive = true
}
