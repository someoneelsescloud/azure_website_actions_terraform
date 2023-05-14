locals {

  # Azure Configuration
  location = "eastus2"
  rg_name  = format("%s-rg", random_pet.name.id)
  web_name = format("%s-website", random_pet.name.id)

  # GitHut Repository
  repo_name = "REPOSITORY-NAME"
}

resource "random_pet" "name" {
  length = 1
}

resource "azurerm_resource_group" "rg" {
  name     = local.rg_name
  location = local.location
}

resource "azurerm_static_site" "webapp" {
  name                = local.web_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = local.location
  sku_size            = "Free"
  sku_tier            = "Free"
}

resource "github_actions_secret" "webapp_api_token" {
  repository      = local.repo_name
  secret_name     = "AZURE_STATIC_WEB_APPS_API_TOKEN"
  plaintext_value = azurerm_static_site.webapp.api_key
}