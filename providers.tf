terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.53.0"
    }

    github = {
      source  = "integrations/github"
      version = "5.25.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.4.3"
    }
  }

  cloud {
    organization = "TERRAFORM-ORG-NAME"

    workspaces {
      name = "TERRAFORM-WORKSPACE-NAME"
    }
  }

}

provider "azurerm" {
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  features {}
}

provider "github" {
  token = var.GITHUB_TOKEN
}