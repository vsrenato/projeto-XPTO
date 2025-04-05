# Dimensionamento de Recursos

- **Controle de Lançamentos**
  - 2 vCPUs / 4GB RAM por pod
  - Escalável até 5 réplicas (EKS)

- **Consolidado Diário**
  - Executado via AWS Lambda
  - 1GB memória / 100 concorrências
  - Tolerância de 5% em picos (50 RPS)