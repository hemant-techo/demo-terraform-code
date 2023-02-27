variable "vpc_name" {
  type        = string
  description = "VPC name"
  default     = "drl-prod"
}

variable "subnet_name" {
  type        = string
  description = "Subnet name"
  default     = "drl-subnet01"
}

variable "project_region" {
  type        = string
  description = "Project Region for resources"
  default     = "us-east1"
}
variable "connector_name" {
  type        = string
  description = "Name for serverless vpc access"
  default     = "drl-prod-connector"
}

variable "connector_machine_type" {
  type        = string
  description = "Machine type of connector"
  default     = "e2-micro"
}