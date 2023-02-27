variable "instance_region" {
  type    = string
  default = "us-east1"
}
variable "vpc_name" {
  default = "drl-prod"
}
variable "instance_name" {
  default = "redis-prod"
}
variable "instance_tier" {
  default = "STANDARD_HA"
}
variable "instance_size" {
  default = "8"
}
variable "replica_count" {
  default = 3
}