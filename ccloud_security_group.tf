resource "aws_security_group" "confluent-cloud" {
  name = "Confluent Cloud"
  description = "Allows access from cluster in Confluent Cloud in a particular region"
  vpc_id = var.vpc-id

  ingress {
    description = "All TCP traffic"
    from_port = 0
    to_port = 65535
    protocol = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

}