variable "key-name" {
  type = string
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

variable "elastic-instance-type" {
  default = "t3.2xlarge"
  type = string
}

variable root-username {
  default = "admin"
}

variable root-password {
  default = "adminsecret"
  sensitive = true
}
