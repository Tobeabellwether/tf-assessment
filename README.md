# TF Assessment

## Project Structure
```shell
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
├── main.tf                   # Main Terraform configuration file for global settings
├── variables.tf              # Global variables definition file
├── outputs.tf                # Global outputs definition file
└── terraform.tfstate         # Terraform state file (typically ignored in .gitignore for remote state)
```

## Run
```shell
terraform apply
terraform output -json instance_ips > instance_ips.json
python3 ping.py
```

## Output
![alt text](output1.png)
![alt text](output2.png)
