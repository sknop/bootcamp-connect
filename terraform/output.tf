output "mysql-hostname" {
  description = "Hostname of the MySQL Instance"
  value = aws_db_instance.mysql.address
}

output "oracle-hostname" {
  description = "Hostname of the Oracle Instance"
  value = aws_db_instance.oracle.address
}

output "elasticsearch-public-ips" {
  description = "Where we can find the elastic search instances"
  value = aws_instance.elasticsearch.*.public_dns
}

output "elasticsearch-private-ips" {
  description = "Where we can find the elastic search instances"
  value = aws_instance.elasticsearch.*.private_dns
}
