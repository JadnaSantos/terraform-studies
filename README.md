## ⏰ Time API – AWS Lambda + Terraform + GitHub Actions
Projeto de estudo e prática com Go, AWS Lambda, Terraform e CI/CD com GitHub Actions.
A aplicação expõe uma função que retorna a hora atual (UTC) em formato JSON.

## 📌 Arquitetura
- Go (Golang) → Implementação da função Lambda que retorna a hora atual.
- AWS Lambda → Execução serverless da função.
- Terraform → Provisionamento da infraestrutura (IAM roles, Lambda, permissões, etc).
- GitHub Actions → Pipeline CI/CD para:
  - Testar o código Go
  - Compilar e empacotar em um ZIP
  - Provisionar a infraestrutura com Terraform
  - Fazer o deploy automático da Lambda


## ⚙️ Pré-requisitos
- Go 1.22+
- Terraform 1.8+
- Conta AWS com permissões de:
- Lambda
- IAM
- CloudWatch Logs
- GitHub Actions secrets configurados

## 🚀 Como rodar localmente
```bash
cd infra
terraform init
terraform plan
terraform apply -auto-approve
```

## 🧹 Destruir a infraestrutura
cd infra
terraform destroy -auto-approve


### ✅ Próximos passos
- Corrigir problemas com a pipeline
- Adicionar suporte a parâmetros de entrada (ex: escolher timezone).
- Criar endpoint público com API Gateway.
- Implementar monitoramento e métricas no CloudWatch.
- Migrar secrets para AWS Secrets Manager.


## O que é o Terraform

O Terraform é uma ferramenta de Infraestrutura como Código (IaC) criada pela HashiCorp.

Ele permite criar, alterar e gerenciar recursos de infraestrutura de forma automática e reprodutível, usando arquivos de configuração declarativos (extensão .tf).

## Benefícios 
Todo o processo de feito de forma manual nos provedores de nuvem (AWS, Azure, GCP), com Infraestrutura é possivel fazer tudo de forma automatizada, ou seja, todo o processo de criação. Além de ter a possibilidade de fazer todo o processo de criação de forma automatizada
é possível ter uma uma padronização de infraestrutura. 

## Terraform na AWS

O Terraform usa providers (provedores) para se comunicar com os serviços de nuvem.

Na AWS, o provider é o AWS Provider, que faz chamadas para a API da AWS e cria os recursos definidos no código.


## Comandos principais

1. Escrever o código (.tf)

```bash
main.tf
```

2. Inicializar o ambiente
   
```bash
terraform init
```


3. Planejar as mudanças

```bash
terraform init
```

4. Aplicar o plano

```bash
terraform apply
```

5. Destruir quando quiser remover tudo

```bash
terraform destroy
```


