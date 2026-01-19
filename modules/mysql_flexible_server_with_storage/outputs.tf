output "mysql_server_fqdn" {
  value       = azurerm_mysql_flexible_server.this.fqdn
}

output "mysql_server_id" {
  value       = azurerm_mysql_flexible_server.this.id
}

output "mysql_server_name" {
  value       = azurerm_mysql_flexible_server.this.name
}

output "mysql_admin_user" {
  value       = azurerm_mysql_flexible_server.this.administrator_login
}

output "mysql_admin_password" {
  value       = azurerm_mysql_flexible_server.this.administrator_password
  sensitive   = true
}