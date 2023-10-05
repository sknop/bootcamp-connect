resource "null_resource" "ansible-playbook" {
  provisioner "local-exec" {
    command = "ansible-playbook playbook.yml"
  }
  depends_on = [
    aws_instance.mysql,
    aws_instance.postgres,
    aws_db_instance.oracle
  ]
}

