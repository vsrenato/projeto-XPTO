# Estratégia FinOps

- Auto Scaling e uso de Spot Instances
- Monitoramento de custos com CloudWatch e Budgets
- Tags padrão para billing e centro de custo

### `terraform/finops-config.yaml`
```yaml
finops:
  scaling:
    type: "auto"
    spot_instances: true
  monitoring:
    services:
      - cloudwatch
      - budgets
  tagging:
    enabled: true
    standard_tags:
      - billing
      - cost_center
```