## 1. Diagrama de Arquitetura

**Arquitetura Híbrida com Integração On-Premises + AWS Cloud**

**Componentes:**
- Usuário final
- Internet / CloudFront (CDN)
- Application Load Balancer (ALB)
- EKS (Kubernetes) – serviços escaláveis
- Lambda (Serverless) – tarefas assíncronas
- RDS (Multi-AZ) – banco gerenciado
- VPC (sub-redes públicas/privadas)
- S3 (backups e logs)
- CloudWatch / Prometheus / Grafana – observabilidade
- VPN/Direct Connect com On-Premises
- VMs on-premises (legado)