Este projeto foi pensado para ir além da mera entrega técnica. Cada decisão tomada aqui está ancorada na experiência com ambientes produtivos híbridos reais e nas boas práticas de arquitetura recomendadas por AWS Well-Architected Framework.

Durante o planejamento e execução, as seguintes decisões demonstram habilidade estratégica:

- **Priorização da modularidade e extensibilidade:** O uso de módulos Terraform reutilizáveis, playbooks Ansible bem estruturados e pipelines CI/CD claros foram pensados para facilitar a manutenção contínua.
- **Trade-offs conscientes:** A escolha por EKS em vez de Fargate ou ECS priorizou controle e observabilidade fine-grained em workloads críticos. Da mesma forma, a retenção parcial do legado on-prem reflete uma abordagem gradual e realista de modernização.
- **FinOps como cultura:** As decisões de design foram tomadas com custo em mente — desde o uso de instâncias spot até a definição de tags e orçamentos.

### O que foi considerado, mas não implementado por limitação de tempo:

- Integração com AWS Step Functions para orquestração de workflows complexos
- Criação de ambiente de homologação separado com políticas distintas
- Pipeline GitOps com ArgoCD para maior controle declarativo
- Uso de AWS Control Tower para governança multi-conta
- Adoção de malha de serviço (Istio) para observabilidade e segurança L7

Essas decisões e propostas adicionais reforçam a capacidade de alinhar soluções técnicas a objetivos de negócio, respeitando prazos e recursos disponíveis.

### Considerações adicionais (não implementadas)
```yaml
consideracoes:
  - step_functions_integracao: false
  - ambiente_homologacao_separado: false
  - gitops_pipeline: false
  - control_tower: false
  - malha_servico_l7: false
```