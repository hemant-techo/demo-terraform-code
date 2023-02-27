variable "db_instance_name" {
  type        = string
  description = "database instance name"
  default     = "prod-psql"
}
variable "db_region" {
  type        = string
  description = "database region"
  default     = "us-east1"
}
variable "db_instance_storage" {
  description = "database instance storage"
  default     = "40"
}
variable "db_instance_tier" {
  type        = string
  description = "database instance tier"
  default     = "db-custom-4-16384"
}
variable "vpc_name" {
  default = "drl-prod"
}
variable "private_network" {
  default = ""
  type    = string
}
variable "project_name" {
  default = "drl-simulator-prod"
  type    = string
}

variable "username" {
  type        = string
  description = "The username for Database"
  default     = "eklccorukyzfnd"
}

variable "password" {
  type        = string
  description = "The password for username"
  default     = "postgres"
  sensitive   = true
}

variable "database_name" {
  type        = list(string)
  description = "Name for database to create"
  default     = ["drl-dashboard_production", "drl-dashboard_test", "drl-dashboard_development"]
}