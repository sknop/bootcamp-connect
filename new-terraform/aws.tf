provider "aws" {
  region = var.region

  default_tags {
    tags = {
      owner_name = var.owner-name
      owner_email = var.owner-email
    }
  }
}
