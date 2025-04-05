# Dimensionamento de Recursos

- **Controle de Lançamentos**
  - 2 vCPUs / 4GB RAM por pod
  - Escalável até 5 réplicas (EKS)

- **Consolidado Diário**
  - Executado via AWS Lambda
  - 1GB memória / 100 concorrências
  - Tolerância de 5% em picos (50 RPS)

## 3. Arquivos YAML para Terraform

### `terraform/eks-dimensionamento.yaml`
```yaml
module: controle_lancamentos
  eks:
    pod:
      cpu: "2"
      memory: "4Gi"
    replicas:
      min: 1
      max: 5
```

### `terraform/lambda-dimensionamento.yaml`
```yaml
resource: consolidado_diario
  lambda:
    memory: "1024"
    concurrency: 100
    tolerance_rps: 50
    tolerance_percent: 5
```