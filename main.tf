provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "main" {
  name     = "rg-terraform-task" # TODO
  location = "West Europe"
}

module "mysql_flexible_server_with_storage" {
  source              = "./modules/mysql_flexible_server_with_storage"
  mysql_server_name   = "valbjon2026-cc" # TODO, only for "terraform validate" :)
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location

  # TODO
  tags = {
    Environment = "dev"
    Owner       = "Valbjon"
    Project     = "CC"
    ManagedBy   = "Terraform"
  }
}