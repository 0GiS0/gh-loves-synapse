variable env_prefix {
  type        = string
  default     = "dev"
  description = "prefix for all resources"
}

variable location {
  type        = string
  default     = "westeurope"
  description = "location for all resources"
}

variable sql_administrator_login {
  type        = string
  default     = "sqladminuser"
  description = "SQL administrator login"
}

variable sql_administrator_login_password {
  type        = string
  default     = "H@Sh1CoR3!"
  description = "SQL administrator login password"
}