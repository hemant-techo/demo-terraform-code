
# DRL Prod Infra Using Terraform

This repository contains Terraform codes which used to spin up Prod environment on Google Cloud. The code is organized into modules and uses the [drl-tf-state](https://console.cloud.google.com/storage/browser/drl-tf-state;tab=objects?forceOnBucketsSortingFiltering=false&project=drl-simulator-prod) storage bucket as backend for state storage and remote execution.

## Setting Up Environment
To use this code, you will need to have Terraform installed on your local machine. You will also need to have an access to GCP environment.

To initialize the Terraform backend and install the required modules, run:
- Install terraform 

```html
https://learn.hashicorp.com/tutorials/terraform/install-cli
```

- Gcloud should be configured
```bash
gcloud auth application-default login
gcloud config set project drl-simulator-prod
``` 

## Run Locally

Clone the project

```bash
  git clone https://github.com/thedroneracingleague/drl-infra-prod.git
```
To initialize working directory
```bash
  terraform init
```

To do a plan

```bash
  terraform plan
```

To apply the resources

```bash
  terraform apply
```

To plan selected module

```bash
  terraform plan -target=module.cloud-run
  terraform plan -var-file="secrets.tfvars" -target=module.secrets
```

To apply selected module


```bash
  terraform apply -target=module.cloud-run
  terraform apply -var-file="secrets.tfvars" -target=module.secrets
```

💡 *secrets.tfvars* should be have variable like this
```bash
secrets = [
  {
    name  = "USERNAME"
    value = "STRONG-KEY"
    label = "all"
  },
  {
    name  = "FOO"
    value = "BAR"
    label = "backend"
  }
]
```
## Modules

This repository contains the following modules:

- Cloud Run: Contains resources for both service dashboard/backend
- GCP Apis: GCP APIs that required for this projects
- Network: Creates VPC, Subnet, Firewalls, Connectors etc
- Postgres: Creates a PSQL DB in Cloud SQL
- Redis: Creates a Redis Instance in Cloud Memorystore
- Registry: Two artifact registry to store container images
- Secrets: Add secrets values in Secret Manager
- Storage Bucket: A bucket to store terraform state

Directory structure for this repo is:
```bash
├── README.md
├── backend.tf
├── main.tf
├── modules
│   ├── cloud-run
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
├── secrets.tfvars
└── variables.tf
```
- main.tf: Holds all modules that need to creates
- variables.tf: Holds variables that need to pass to main.tf
- .tfvars: Holds values that need to be locally available like secrets
- modules/module-name/main.tf: Holds actual resources that need to be created
- modules/module-name/outputs.tf: Holds if any informantion that need to pass to another modules
- modules/module-name/variables.tf: Holds variables for the resources