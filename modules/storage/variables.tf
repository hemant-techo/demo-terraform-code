variable "bucket_name" {
  type        = string
  description = "Globally Unique Cloud Storage Bucket Name"
}

variable "bucket_region" {
  type        = string
  description = "Cloud Storage Locations"
  default     = "us-east1"
}

variable "project_name" {
  type        = string
  description = "Project name"
}