# Monitoramento e Observabilidade

- Prometheus + Grafana (serviços)
- CloudWatch + Logs Insights (Lambda / RDS)
- Alertas com SNS

### `terraform/monitoramento.yaml`
```yaml
observability:
  services:
    - prometheus
    - grafana
    - cloudwatch
    - logs_insights
  alerts:
    service: sns
```