resource "aws_ecs_cluster" "fargate_cluster" {
  name = "xpto-fargate"
}

resource "aws_sfn_state_machine" "step_function" {
  name     = "xpto-orquestrador"
  role_arn = aws_iam_role.lambda_exec.arn
  definition = file("stepfunctions/definition.json")
}

resource "aws_sfn_state_machine" "orquestrador" {
  name     = "xpto-orquestrador"
  role_arn = aws_iam_role.lambda_exec.arn
  definition = jsonencode({
    Comment = "Orquestração de jobs via Step Functions",
    StartAt = "Job1",
    States = {
      Job1 = {
        Type = "Task",
        Resource = aws_lambda_function.consolidado_diario.arn,
        End = true
      }
    }
  })
}