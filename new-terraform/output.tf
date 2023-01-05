output "mysql-hostname" {
  description = "Hostname of the MySQL Instance"
  value = aws_instance.mysql.*.public_dns
}

output "oracle-hostname" {
  description = "Hostname of the Oracle Instance"
  value = aws_instance.oracle.*.public_dns
}

output "elasticsearch-public-ips" {
  description = "Where we can find the elastic search instances"
  value = aws_instance.elastic.*.public_dns
}

output "elasticsearch-private-ips" {
  description = "Where we can find the elastic search instances"
  value = aws_instance.elastic.*.private_dns
}
