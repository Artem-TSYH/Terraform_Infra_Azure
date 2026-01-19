variable "resource_group_name" {
  type        = string
  description = "Name of the resource group where resources will be created."
}

variable "location" {
  type        = string
  description = "Azure region for all resources."
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags to apply to all resources."
}

variable "mysql_server_name" {
  type        = string
  description = "A unique name that identifies your instance of Azure Database for MySQL - Flexible Server. The domain name mysql.database.azure.com is appended to the server name you enter. The server name can contain only lowercase letters, numbers, and the hyphen (-) character."
  # It must contain between 3 and 63 characters.
  validation {
    condition = (
      length(var.mysql_server_name) >= 3 &&
      length(var.mysql_server_name) <= 63 &&
      can(regex("^[a-z0-9-]+$", var.mysql_server_name))
    )
    error_message = "The server name can contain only lowercase letters, numbers, and the hyphen (-) character."
  }
}

variable "mysql_admin_user" {
  type        = string
  description = "Admin username for MySQL."
  default     = "mysqladmin" # REMOVE, only for "terraform validate" :)
}

variable "mysql_admin_password" {
  type        = string
  description = "Admin password for MySQL."
  sensitive   = true
}

variable "mysql_version" {
  type        = string
  description = "The version of the MySQL Flexible Server to use. Possible values are 5.7, 8.0.21 and 8.4."
  default     = "8.4"
}

variable "mysql_zone" {
  type        = number
  description = "Specifies the Availability Zone in which this MySQL Flexible Server should be located. Possible values are 1, 2 and 3."
  default     = 1
}

variable "mysql_storage_gb" {
  type        = number
  description = "The max storage allowed for the MySQL Flexible Server. Possible values are between 20 and 16384."
  default     = 32
}

variable "mysql_backup_retention_days" {
  type        = number
  description = "The backup retention days for the MySQL Flexible Server. Possible values are between 1 and 35 days. Defaults to 7."
  default     = 7
}

variable "mysql_sku_name" {
  type        = string
  description = "The SKU Name for the MySQL Flexible Server. Note: sku_name should start with SKU tier B (Burstable), GP (General Purpose), MO (Memory Optimized) like B_Standard_B1ms."
  default     = "B_Standard_B1s" # Minimal: 1 vCore, 1 GB
}

### PART 2
variable "storage_account_name" {
  type        = string
  description = "Name of the Storage Account."
  default     = "unique2026ccgermany"
}