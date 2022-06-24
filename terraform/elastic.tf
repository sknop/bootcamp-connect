resource "aws_instance" "elasticsearch" {
  count         = 3
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.elastic-instance-type
  subnet_id         = element(var.subnet-ids,count.index)
  availability_zone = element(var.availability-zones, count.index)
  # security_groups = ["${var.security_group}"]
  vpc_security_group_ids = var.security-groups
  key_name = var.key-name
  root_block_device {
    volume_size = 64 # 64 GB
  }
  tags = {
    Name = "bootcamp-elastic-${count.index}-${element(var.availability-zones, count.index)}"
    description = "Advanced bootcamp elasticsearch nodes - Managed by Terraform"
    nice-name = "elasticserach-${count.index}"
    nodeId = count.index
    role = "elasticsearch"
    Owner_Name = var.owner-name
    Owner_Email = var.owner-email
    sshUser = "ubuntu"
    # sshPrivateIp = true // this is only checked for existence, not if it's true or false by terraform.py (ati)
    createdBy = "terraform"
    Schedule = "zookeeper-mon-8am-fri-6pm"
  }
}
