
output "security_groups" {
  value = merge(
    aws_security_group.security_groups,
    {allow_all_outbound_traffic_security_group = aws_security_group.allow_all_outbound_traffic_security_group}
  )
}
