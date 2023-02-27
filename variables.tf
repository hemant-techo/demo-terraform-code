variable "project_name" {
  type        = string
  description = "Name for the Google Compute project"
  default     = "drl-simulator-prod"
}

variable "project_region" {
  type        = string
  description = "Project Region for resources"
  default     = "us-east1"
}

variable "subnet_name" {
  type        = string
  description = "Subnet name"
  default     = "drl-subnet01"
}

variable "secrets" {
  type        = list(map(string))
  description = "Add Secrets with Value for Secret Manager [use tfvars file]"
  sensitive   = true
  default = [{
    "name"  = "test"
    "value" = "test"
    "label" = "test"
  }]
}
variable "psql_connection_name" {
  type        = string
  description = "Connection name for SQL"
  default     = ""
}

variable "vpc_connector_name" {
  type        = string
  description = "Serverless VPC Connector name"
  default     = ""
}