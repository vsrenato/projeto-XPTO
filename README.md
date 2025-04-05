# Arquitetura Híbrida – Empresa XPTO

Este projeto propõe uma arquitetura híbrida moderna e resiliente para suportar os serviços de controle financeiro da empresa XPTO. Utiliza infraestrutura on-premises integrada à AWS, garantindo escalabilidade, segurança e economia.

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