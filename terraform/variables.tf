variable "env_prefix" {
  type        = string
  default     = "dev"
  description = "prefix for all resources"
}

variable "location" {
  type        = string
  default     = "westeurope"
  description = "location for all resources"
}

variable "sql_administrator_login" {
  type        = string
  default     = "sqladminuser"
  description = "SQL administrator login"
}

variable "sql_administrator_login_password" {
  type        = string
  default     = "H@Sh1CoR3!"
  description = "SQL administrator login password"
}

variable "home_ip" {
  type        = string
  default     = ""
  description = "Home IP address"
}

variable "github_account_name" {
  type        = string
  default     = "0GiS0"
  description = "Github handler"
}

variable "github_branch_name"{
  type        = string
  default     = "main"
  description = "Github branch"
}

variable "github_repository_name"{
  type        = string
  default     = "gh-loves-synapse"
  description = "Github repository"
}

variable "github_root_folder"{
  type        = string
  default     = "/"
  description = "Github root folder"
}

variable "user_object_id"{
  type        = string
  default     = "7b040292-9428-43b5-91a1-031d3d8b5427"
  description = "User object id"
}