output "mysql_server_fqdn" {
  description = "The fully qualified domain name of the MySQL Flexible Server."
  value       = azurerm_mysql_flexible_server.this.fqdn
}

output "mysql_server_id" {
  description = "The ID of the MySQL Flexible Server."
  value       = azurerm_mysql_flexible_server.this.id
}

output "mysql_server_name" {
  description = "The name of the MySQL Flexible Server."
  value       = azurerm_mysql_flexible_server.this.name
}

output "mysql_server_admin_user" {
  value       = azurerm_mysql_flexible_server.this.administrator_login
}

output "mysql_server_admin_password" {
  value       = azurerm_mysql_flexible_server.this.administrator_password
  sensitive   = true
}