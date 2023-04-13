# Define Lambda function
resource "aws_lambda_function" "test_lambda" {
  function_name    = "test_lambda"
  runtime          = "python3.9"
  handler          = "main.handler"
  role             = aws_iam_role.lambda_role.arn
#  filename         = "lambda_function.zip"
  s3_bucket     = "jdfilter123"
  s3_key        = "Jdfilter.zip"
 # source_code_hash = filebase64sha256("lambda_function.zip")
}
