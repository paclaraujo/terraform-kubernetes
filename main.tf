terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.26"
    }
  }

  required_version = ">= 0.14.9"
}

provider "azurerm" {
  skip_provider_registration = false
  features {}
}

resource "azurerm_resource_group" "tf_kubernetes_rg" {
  name     = "terraform-kubernetes"
  location = "eastus"
}

resource "azurerm_kubernetes_cluster" "tf_kubernetes_cluster" {
  name                = "aks-cluster"
  location            = azurerm_resource_group.tf_kubernetes_rg.location
  resource_group_name = azurerm_resource_group.tf_kubernetes_rg.name
  dns_prefix          = "terraformaks"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }
}

output "client_certificate" {
  value = azurerm_kubernetes_cluster.tf_kubernetes_cluster.kube_config.0.client_certificate
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.tf_kubernetes_cluster.kube_config_raw
  sensitive = true
}