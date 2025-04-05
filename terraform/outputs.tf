output "eks_cluster_name" {
  description = "Nome do cluster EKS"
  value       = aws_eks_cluster.main.name
}

output "lambda_function_name" {
  description = "Nome da função Lambda"
  value       = aws_lambda_function.consolidado_diario.function_name
}

output "rds_endpoint" {
  description = "Endpoint do banco de dados RDS"
  value       = aws_db_instance.rds_instance.endpoint
}

output "s3_backup_bucket" {
  description = "Nome do bucket S3 para backup"
  value       = aws_s3_bucket.backup.bucket
}

output "cloudwatch_budget_name" {
  description = "Nome do orçamento configurado no CloudWatch Budgets"
  value       = aws_budgets_budget.cost_monitoring.name
}
