output "mysql-hostname-eip" {
  description = "Hostname of the MySQL Instance"
  value = aws_eip.mysql.public_dns
}

output "postgres-hostname-eip" {
  description = "Hostname of the Postgres Instance"
  value = aws_eip.postgres.public_dns
}

output "mysql-hostname" {
  description = "Hostname of the MySQL Instance"
  value = aws_instance.mysql.public_dns
}

output "postgres-hostname" {
  description = "Hostname of the Postgres Instance"
  value = aws_instance.postgres.public_dns
}


output "oracle-hostname" {
  description = "Hostname of the Oracle Instance"
  value = aws_db_instance.oracle.address
}

output "elasticsearch-public-ips" {
  description = "Where we can find the elastic search instances"
  value = aws_instance.elastic.*.public_dns
}

output "elasticsearch-private-ips" {
  description = "Where we can find the elastic search instances"
  value = aws_instance.elastic.*.private_dns
}

output "domain-name" {
  description = "The name of the domain for the hosted zone"
  value = data.aws_route53_zone.domain.name
}
