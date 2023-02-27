terraform {
  backend "gcs" {
    bucket = "drl-tf-state"
    prefix = "terraform/state"
  }
}