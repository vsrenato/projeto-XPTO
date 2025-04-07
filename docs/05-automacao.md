# Automação com Terraform e Ansible

- Terraform para provisionamento de rede, EKS, RDS
- Ansible para configuração de VMs on-prem
- CI/CD com GitHub Actions

name: Infraestrutura Híbrida - Terraform e Ansible

on:
  push:
    branches:
      - main
  workflow_dispatch:

jobs:
  terraform:
    name: Provisionar Infra com Terraform
    runs-on: ubuntu-latest

    env:
      TF_VAR_region: us-east-1
      AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
      AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}

    steps:
      - name: Checkout do repositório
        uses: actions/checkout@v3

      - name: Configurar Terraform
        uses: hashicorp/setup-terraform@v3
        with:
          terraform_version: 1.6.6

      - name: Inicializar Terraform
        run: terraform init

      - name: Validar código
        run: terraform validate

      - name: Aplicar infraestrutura
        run: terraform apply -auto-approve

  ansible:
    name: Configurar VMs On-Prem com Ansible
    runs-on: ubuntu-latest
    needs: terraform

    steps:
      - name: Checkout do repositório
        uses: actions/checkout@v3

      - name: Instalar Ansible
        run: |
          sudo apt update
          sudo apt install -y ansible

      - name: Executar playbook Ansible
        run: |
          ansible-playbook ansible/site.yml -i ansible/inventory.ini
