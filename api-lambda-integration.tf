#resource "aws_api_gateway_resource" "v1" {
#  rest_api_id = aws_api_gateway_rest_api.example.id
#  parent_id   = aws_api_gateway_rest_api.example.root_resource_id
#  path_part   = "v1"
#}

resource "aws_api_gateway_method" "post" {
  rest_api_id       = aws_api_gateway_rest_api.example.id
  resource_id       = aws_api_gateway_rest_api.example.root_resource_id   #aws_api_gateway_resource.v1.id
  http_method       = "POST"
  authorization     = "NONE"
  api_key_required  = false
}

resource "aws_api_gateway_integration" "integration" {
  rest_api_id             = aws_api_gateway_rest_api.example.id
  resource_id             = aws_api_gateway_rest_api.example.root_resource_id # aws_api_gateway_resource.v1.id
  http_method             = aws_api_gateway_method.post.http_method
  integration_http_method = "POST"
    type                    = "AWS_PROXY"
   uri                     = aws_lambda_function.test_lambda.invoke_arn
  }
  
  resource "aws_api_gateway_method" "get" {
    rest_api_id       = aws_api_gateway_rest_api.example.id
    resource_id       = aws_api_gateway_rest_api.example.root_resource_id  # aws_api_gateway_resource.v1.id
    http_method       = "GET"
    authorization     = "NONE"
    api_key_required  = false
  }
  
  resource "aws_api_gateway_integration" "integration-get" {
    rest_api_id             = aws_api_gateway_rest_api.example.id
    resource_id             = aws_api_gateway_rest_api.example.root_resource_id   # aws_api_gateway_resource.v1.id
    http_method             = aws_api_gateway_method.get.http_method
    integration_http_method = "GET"
    type                    = "AWS_PROXY"
    uri                     = aws_lambda_function.test_lambda.invoke_arn
    }
   #-------
   resource "aws_api_gateway_method" "put" {
      rest_api_id       = aws_api_gateway_rest_api.example.id
      resource_id       = aws_api_gateway_rest_api.example.root_resource_id  # aws_api_gateway_resource.v1.id
      http_method       = "PUT"
      authorization     = "NONE"
      api_key_required  = false
  }
  
   resource "aws_api_gateway_integration" "integration-put" {
      rest_api_id             = aws_api_gateway_rest_api.example.id
      resource_id             = aws_api_gateway_rest_api.example.root_resource_id   # aws_api_gateway_resource.v1.id
      http_method             = aws_api_gateway_method.put.http_method
      integration_http_method = "PUT"
      type                    = "AWS_PROXY"
      uri                     = aws_lambda_function.test_lambda.invoke_arn
    }
     resource "aws_api_gateway_method" "delete" {
      rest_api_id       = aws_api_gateway_rest_api.example.id
      resource_id       = aws_api_gateway_rest_api.example.root_resource_id  # aws_api_gateway_resource.v1.id
      http_method       = "DELETE"
      authorization     = "NONE"
      api_key_required  = false
  }
   
    resource "aws_api_gateway_integration" "integration-delete" {
      rest_api_id             = aws_api_gateway_rest_api.example.id
      resource_id             = aws_api_gateway_rest_api.example.root_resource_id   # aws_api_gateway_resource.v1.id
      http_method             = aws_api_gateway_method.delete.http_method
      integration_http_method = "DELETE"
      type                    = "AWS_PROXY"
      uri                     = aws_lambda_function.test_lambda.invoke_arn
    }                                                      
