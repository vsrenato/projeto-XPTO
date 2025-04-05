resource "aws_lambda_function" "consolidado_diario" {
  function_name = "consolidado-diario"
  role          = aws_iam_role.lambda_exec.arn
  handler       = "index.handler"
  runtime       = "python3.9"
  memory_size   = var.lambda_memory_size
  reserved_concurrent_executions = var.lambda_reserved_concurrent_executions

  filename      = "lambda/consolidado_diario.zip"
  source_code_hash = filebase64sha256("lambda/consolidado_diario.zip")
}

resource "aws_iam_role" "lambda_exec" {
  name = "lambda_exec_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Effect = "Allow",
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }]
  })
}