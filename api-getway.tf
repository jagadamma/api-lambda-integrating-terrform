resource "aws_api_gateway_rest_api" "example" {
  name = "api_gateway"
  description = "My API Gateway"
  body        = "${file("my-app-spec.yaml")}"
  endpoint_configuration {
    types = ["REGIONAL"]
 }
 }
