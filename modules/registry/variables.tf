variable "location" {
  type        = string
  description = "Default location for Artifact Registry"
  default     = "us-east1"
}

variable "repo-name" {
  type        = string
  description = "Repository Name"
  default     = "drl-dashboard"
}

variable "repo-name-2" {
  type        = string
  description = "Second Repository Name"
  default     = "drl-backend"
}