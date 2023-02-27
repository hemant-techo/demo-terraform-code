terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.51.0"
    }
  }
}

provider "google" {
  project = var.project_name
  region  = var.project_region
}

module "storage_bucket" {
  source       = "./modules/storage"
  bucket_name  = "drl-tf-state"
  project_name = var.project_name
}

module "gcp_apis" {
  source = "./modules/gcp-apis"
}

module "network" {
  source = "./modules/network"
}

module "redis" {
  source = "./modules/redis"
}
module "secrets" {
  source  = "./modules/secrets"
  secrets = var.secrets
}

module "registry" {
  source = "./modules/registry"
}

module "cloud-run" {
  source               = "./modules/cloud-run"
  depends_on           = [module.registry]
  psql_connection_name = module.postgres.connection_name
  vpc_connector_name   = module.network.vpc_connector_name

}
module "postgres" {
  source          = "./modules/postgres"
  private_network = module.network.network_id
}

module "iam" {
  source = "./modules/iam"
}