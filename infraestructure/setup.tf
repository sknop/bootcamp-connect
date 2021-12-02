# EU (Ireland)  eu-west-1
# EU (London) eu-west-2
# EU (Frankfurt) eu-central-1


variable "region" {
  default = "eu-west-1"
}

variable "Owner_Name" {
  default = "Pere Urbon"
}


variable "Owner_Email" {
  default = "pere@confluent.io"
}

variable "ownershort" {
  default = "pub"
}

variable "instance_type" {
  default = "t2.medium"
}

variable "myip" {
  default = "78.55.73.227"
}

module "ireland-cluster" {
  source         = "./bootcamp-connect"
  name           = "ireland-cluster"
  region         = "eu-west-1"
  azs            = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  Owner_Name     = var.Owner_Name
  Owner_Email    = var.Owner_Email
  key_name       = "purbon-ireland-sa"
  myip           = var.myip
  ownershort     = var.ownershort
}
