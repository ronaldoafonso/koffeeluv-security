
resource "aws_security_group" "security_groups" {
  for_each    = var.security_groups
  name        = each.value.name
  description = each.value.description
  vpc_id      = var.vpc_id

  ingress {
    description      = each.value.ingress.description
    from_port        = each.value.ingress.from_port
    to_port          = each.value.ingress.to_port
    protocol         = each.value.ingress.protocol
    cidr_blocks      = each.value.ingress.cidr_blocks
    ipv6_cidr_blocks = each.value.ingress.ipv6_cidr_blocks
  }

  egress {
    description      = each.value.egress.description
    from_port        = each.value.egress.from_port
    to_port          = each.value.egress.to_port
    protocol         = each.value.egress.protocol
    cidr_blocks      = each.value.egress.cidr_blocks
    ipv6_cidr_blocks = each.value.egress.ipv6_cidr_blocks
  }

  tags = {
    Name        = each.value.tags.name
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
