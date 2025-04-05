resource "aws_cloudwatch_metric_alarm" "rds_cpu" {
  alarm_name          = "rds-high-cpu"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/RDS"
  period              = "300"
  statistic           = "Average"
  threshold           = "80"
  alarm_description   = "Alerta de uso elevado de CPU no RDS"
  dimensions = {
    DBInstanceIdentifier = aws_db_instance.rds_instance.id
  }
  alarm_actions = [aws_sns_topic.alertas.arn]
}

resource "aws_sns_topic" "alertas" {
  name = "xpto-alertas"
}