resource "aws_cloudwatch_log_group" "lambda_logs" {
  name = "/aws/lambda/consolidado-diario"
  retention_in_days = 14
}

resource "aws_sns_topic" "alerts" {
  name = "infra-alerts"
}

resource "aws_cloudwatch_metric_alarm" "lambda_errors" {
  alarm_name          = "LambdaErrorAlarm"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "1"
  metric_name         = "Errors"
  namespace           = "AWS/Lambda"
  period              = "60"
  statistic           = "Sum"
  threshold           = "1"
  alarm_actions       = [aws_sns_topic.alerts.arn]
  dimensions = {
    FunctionName = aws_lambda_function.consolidado_diario.function_name
  }
}