
resource "aws_security_group" "security_groups" {
  for_each    = var.security_groups
  name        = each.value.name
  description = each.value.description
  vpc_id      = var.vpc_id

  ingress {
    description      = each.value.ingress.description
    from_port        = each.value.ingress.from_port
    to_port          = each.value.ingress.to_port
    protocol         = "tcp"
    cidr_blocks      = each.value.ingress.cidr_blocks
    ipv6_cidr_blocks = each.value.ingress.ipv6_cidr_blocks
  }

  tags = {
    Name        = each.value.tags.name
    Environment = var.environment
  }
}

resource "aws_security_group" "allow_all_outbound_traffic_security_group" {
  name        = "allow_all_outbound_traffic_security_group"
  description = "Allow all traffic going to the Internet"
  vpc_id      = var.vpc_id

  egress {
    description      = "Allow all outbound traffic"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name        = "allow-all-outbound-traffic"
    Environment = var.environment
  }
}

resource "aws_key_pair" "key_pairs" {
  for_each   = var.key_pairs
  key_name   = each.value.name
  public_key = each.value.public_key

  tags = {
    Name        = each.value.name
    Environment = var.environment
  }
}
