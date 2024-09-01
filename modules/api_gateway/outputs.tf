# modules/api_gateway/outputs.tf

output "invoke_url" {
  value = aws_api_gateway_stage.main.invoke_url
}

output "stage_arn" {
  value = aws_api_gateway_stage.main.arn
}