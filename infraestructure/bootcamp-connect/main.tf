terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.68"
    }
  }
}

provider "aws" {
  region = var.region
}

locals {
  bastion-instance-type = "t2.large"
  zk-instance-type = "t2.large"
  connect-instance-type = "t2.large"
  broker-instance-type = "t2.large"
  c3-instance-type = "t2.large"
  client-instance-type = "t2.large"
  tools-instance-type = "t2.large"
}

locals {
  brokers-eu-west-one = "0.0.0.0/0" # need to lock this down
  brokers-eu-central-one = "0.0.0.0/0" # need to lock this down
  brokers-all = "0.0.0.0/0" # need to lock this down
}

variable "azs" {
  description = "Run the EC2 Instances in these Availability Zones"
  type = list
}

variable "myip" { }
locals {
  myip-cidr = "${var.myip}/32"
}
