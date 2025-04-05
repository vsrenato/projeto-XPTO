resource "aws_budgets_budget" "cost_monitoring" {
  name              = "xpto-cost-budget"
  budget_type       = "COST"
  limit_amount      = "500.0"
  limit_unit        = "USD"
  time_unit         = "MONTHLY"
  cost_filters = {}
  cost_types {
    include_credit = true
  }
  time_period_start = formatdate("YYYY-MM-DD", timestamp())
}

resource "aws_launch_template" "eks_nodes" {
  name_prefix   = "eks-spot-template"
  image_id      = "ami-0c55b159cbfafe1f0" # exemplo
  instance_type = var.eks_instance_type
  instance_market_options {
    market_type = "spot"
  }
  tag_specifications {
    resource_type = "instance"
    tags = {
      Project = "xpto"
      Environment = "production"
      CostCenter = "TI"
    }
  }
}