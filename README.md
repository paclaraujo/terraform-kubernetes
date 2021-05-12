# Kubernetes

Provisionamento de AKS cluster via terraform e criação de dois pods (nginx e mysql).

## Pré Requisitos

Para rodar este projeto são necessárias as seguintes instalações: 

- [Terraform](https://www.terraform.io/)
- [Azure CLI](https://docs.microsoft.com/pt-br/cli/azure/install-azure-cli)
- [Kubectl](https://kubernetes.io/docs/tasks/tools/)

## Instalação

Após instalação do Terraform e da Azure CLI, execute os seguintes comandos para rodar o projeto localmente:

Clone o projeto em sua máquina:
```sh
git clone https://github.com/paclaraujo/terraform-kubernetes
```

Faça login em sua conta azure:
```sh
az login
```

Inicie o repositório com o terraform:
```sh
terraform init
```

Visualize as alterações que serão executadas pelas configurações atuais do repositório:
```sh
terraform plan
```

Crie ou atualize a infraestrutura:
```sh
terraform apply
```

## Criando os pods e serviços no AKS

Primeiro realize a conexão da sua máquina local com o aks:

```sh
az aks get-credentials --resource-group terraform-kubernetes --name aks-cluster
```

Crie os pods executando:

```sh
kubectl apply -f pods
```

Crie os serviços executando: 

```sh
kubectl apply -f services
```

Para verificar o status dos pods e serviços execute:

```sh
kubectl get all
```

## Tecnologias usadas

- [Terraform](https://www.terraform.io/)
- [Azure CLI](https://docs.microsoft.com/pt-br/cli/azure/install-azure-cli)
- [Azure](https://azure.microsoft.com/pt-br/)
- [AKS](https://azure.microsoft.com/pt-br/services/kubernetes-service/)
- [Kubernetes](https://kubernetes.io/)
- [Kubectl](https://kubernetes.io/docs/tasks/tools/)

## Autora

* **Paloma Araujo** - [@paclaraujo](https://github.com/paclaraujo)



