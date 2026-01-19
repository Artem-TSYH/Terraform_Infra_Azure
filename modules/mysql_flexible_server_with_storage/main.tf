terraform {
  required_version = ">= 1.3.0"

  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~> 4.57.0"
    }
  }
}

resource "azurerm_mysql_flexible_server" "this" {

  resource_group_name    = var.resource_group_name
  location               = var.location
  tags                   = var.tags

  lifecycle {
    prevent_destroy      = true
  }

  name                   = var.mysql_server_name
  administrator_login    = var.mysql_admin_user
  administrator_password = var.mysql_admin_password

  version                = var.mysql_version

  zone                   = var.mysql_zone

  storage {
    size_gb              = var.mysql_storage_gb
  }

  backup_retention_days  = var.mysql_backup_retention_days

  sku_name               = var.mysql_sku_name
}