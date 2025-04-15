# Arquitetura Híbrida – Empresa XPTO

Este projeto propõe uma arquitetura híbrida moderna e resiliente para suportar os serviços de controle financeiro da empresa XPTO. Utiliza infraestrutura on-premises integrada à AWS, garantindo escalabilidade, segurança e economia.

# Proposta

A proposta visa garantir alta disponibilidade, automação, observabilidade e governança de custos.

# Visão Geral

A arquitetura proposta é dividida em ambiente on-premises para VMs legadas e cloud (AWS) com serviços gerenciados. Utilizamos EKS para o serviço de lançamentos e Lambda para o consolidado.

# Arquitetura de Transição vs Alvo

A arquitetura de transição mantém cargas legadas on-premises com conexão segura à nuvem. A arquitetura alvo migra gradualmente essas cargas para containers e serverless na AWS, com adoção futura de Service Mesh e GitOps com ArgoCD.

# Justificativas Técnicas

Escolhi EKS por permitir controle granular com escalabilidade. Lambda foi ideal para o consolidado diário por ser esporádico. RDS Multi-AZ garante alta disponibilidade, e S3 com versionamento atende à retenção de backups. CI/CD com GitHub Actions garante integração contínua e entrega segura.

# Estratégia de DR

Defini um RTO de 10 minutos com failover automático via RDS Multi-AZ e recuperação do app via novos pods. RPO de 5 minutos é garantido com backups incrementais contínuos em S3 e snapshots automatizados via Lambda scheduler.

# Automação

Automatizei tudo com Terraform e Ansible. Terraform provê toda a estrutura cloud; Ansible gerencia as VMs on-premises. Integramos GitHub Actions para CI/CD com ambientes provisionados sob demanda.

# Considerações

Reforcei práticas modernas como GitOps, IaC e DR orientado a objetivos de negócio (RTO/RPO).

## Tecnologias Utilizadas
- AWS (EKS, Lambda, RDS, S3, CloudWatch)
- Terraform / Ansible
- Kubernetes
- GitHub Actions

## Como rodar
1. Clone este repositório
2. Edite os arquivos de variáveis do Terraform conforme necessário
3. Execute `terraform init && terraform apply`
4. Execute o playbook Ansible com `ansible-playbook -i inventory.ini playbook.yml`