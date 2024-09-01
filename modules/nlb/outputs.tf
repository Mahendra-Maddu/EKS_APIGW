# modules/nlb/outputs.tf

output "nlb_dns_name" {
  value = aws_lb.main.dns_name
}

output "vpc_link_id" {
  value = aws_api_gateway_vpc_link.main.id
}