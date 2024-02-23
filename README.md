# TF Assessment

## Project Structure
tf-assessment/
│
├── modules/                  # Directory for Terraform modules
│   ├── network/              # Module for network resources (VPC, subnets, etc.)
│   │   ├── main.tf           # Main file for network module resources
│   │   ├── variables.tf      # Variables for network module
│   │   └── outputs.tf        # Outputs for network module
│   ├── compute/              # Module for compute resources (VM instances, autoscaling groups)
│   │   ├── main.tf           # Main file for compute module resources
│   │   ├── variables.tf      # Variables for compute module
│   │   └── outputs.tf        # Outputs for compute module
│   └── storage/              # Module for storage resources (buckets, databases)
│       ├── main.tf           # Main file for storage module resources
│       ├── variables.tf      # Variables for storage module
│       └── outputs.tf        # Outputs for storage module
│
├── environments/             # Directory for environment-specific configurations
│   ├── dev/                  # Development environment
│   │   ├── main.tf           # Main file for dev environment, calling modules
│   │   ├── variables.tf      # Variables specific to dev environment
│   │   └── terraform.tfvars  # Variable values for dev environment
│   ├── staging/              # Staging environment
│   │   ├── main.tf           # Main file for staging environment, calling modules
│   │   ├── variables.tf      # Variables specific to staging environment
│   │   └── terraform.tfvars  # Variable values for staging environment
│   └── prod/                 # Production environment
│       ├── main.tf           # Main file for prod environment, calling modules
│       ├── variables.tf      # Variables specific to prod environment
│       └── terraform.tfvars  # Variable values for prod environment
│
├── main.tf                   # Main Terraform configuration file for global settings
├── variables.tf              # Global variables definition file
├── outputs.tf                # Global outputs definition file
└── terraform.tfstate         # Terraform state file (typically ignored in .gitignore for remote state)
