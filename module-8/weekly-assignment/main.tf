module "keyvault" {
  # Source 
  source = "./keyvault"

  # Project config
  project_name = var.project_name
  rg_kv_name = "kv"
  rg_kv_location = var.location
  environment = local.common_tags.environment
  
  # Tags
  common_tags = local.common_tags
}


module "database" {
  # Source of the Database module 
  source = "./database"

  # Project configuration 
  project_name = local.common_tags.project_name
  location = var.location

  # Database configuration
  databases = {
    # Database for all of the users 
    users = {
      name        = "users"
      max_size_gb = 6
    }

    # Database for keeping log data
    logs = {
      name        = "logs"
      max_size_gb = 10
    }

    # Database for storing client information 
    clients = {
      name        = "clients"
      max_size_gb = 8
    }

  }
  
  ## Login credentials 
  username_sql_server = "sql-login-#1234"
  key_vault_id = module.keyvault.key_vault_id

  # Common tags 
  common_tags = local.common_tags

}