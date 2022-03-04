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
  elastic-instance-type = "t3.2xlarge"
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

variable "myips" {
  type    = list(string)
  default = []
}

locals {
 //  myip-cidr = "${var.myip}/32"
  myip-cidrs = [for myip in var.myips : "${myip}/32" ]
}
