variable "templatefile" {
  default = "inventory.tftpl"
}

variable "inventory_file" {
  default = "inventory"
}

resource "local_file" "ansible_inventory" {
  content = templatefile("${path.module}/${var.templatefile}", {
    mysql_host = aws_eip.postgres.public_dns,
    postgres_host = aws_eip.postgres.public_dns,
    oracle_host = aws_db_instance.oracle.address
    private_key_file = var.private-key
    domain_name = data.aws_route53_zone.domain.name
  })
  filename = var.inventory_file
}
