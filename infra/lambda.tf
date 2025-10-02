resource "aws_lambda_function" "time_api" {
  function_name = local.lambda_function_name
  role          = aws_iam_role.lambda_role.arn

  package_type     = "Zip"
  filename         = "${path.module}/../function.zip"
  source_code_hash = filebase64sha256("${path.module}/../function.zip")

  runtime       = "provided.al2"
  handler       = "bootstrap"
  architectures = local.arch == "arm64" ? ["arm64"] : ["x86_64"]
  timeout       = 10
  memory_size   = 128

  environment {
    variables = {
      ENVIRONMENT = local.environment
    }
  }

  tags = local.common_tags

  depends_on = [
    aws_iam_role_policy_attachment.lambda_basic_execution,
    aws_iam_role_policy.lambda_policy
  ]
}

resource "aws_cloudwatch_log_group" "lambda_logs" {
  name              = "/aws/lambda/${local.lambda_function_name}"
  retention_in_days = 7
  tags              = local.common_tags
}

resource "aws_lambda_function_url" "time_api_url" {
  function_name      = aws_lambda_function.time_api.function_name
  authorization_type = "NONE"
  cors {
    allow_origins = ["*"]
    allow_methods = ["GET"]
  }
}

resource "aws_lambda_permission" "function_url_public" {
  statement_id           = "AllowPublicInvokeViaFunctionUrl"
  action                 = "lambda:InvokeFunctionUrl"
  function_name          = aws_lambda_function.time_api.function_name
  principal              = "*"
  function_url_auth_type = "NONE"
}

# Saídas úteis
output "lambda_name" {
  value = aws_lambda_function.time_api.function_name
}

output "function_url" {
  value = aws_lambda_function_url.time_api_url.function_url
}
