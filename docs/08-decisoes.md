## Decisões Arquiteturais Tomadas

- **EKS vs ECS**: Optamos pelo EKS por ser mais flexível e compatível com o modelo Kubernetes já usado pela equipe, permitindo maior portabilidade e controle.
- **Integração com On-Premises via VPN**: Apesar do Direct Connect oferecer melhor performance, a VPN foi adotada neste estágio por sua rápida implantação e custo mais baixo.
- **Lambda para tarefas assíncronas**: Reduz custo com provisionamento de máquinas fixas e facilita escalar em tarefas event-driven.

## O que gostaríamos de ter evoluído

- **Pipelines GitOps com ArgoCD**: Facilitaria o deploy contínuo e auditável via Git.
- **Service Mesh com Istio**: Para controle fino de tráfego, segurança mTLS entre serviços e observabilidade avançada.
- **Adoção de Fargate**: Elimina a gestão de nodes para workloads leves, reduzindo a carga operacional.
- **Chaos Engineering**: Implementação de testes de resiliência com ferramentas como Litmus ou AWS Fault Injection Simulator.