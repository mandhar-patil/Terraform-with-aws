Terraform for DevOps Engineers

This repository is your one-stop solution for learning and using Terraform for DevOps engineers.

1. Setup & Initialization
Install Terraform

Linux & macOS:

curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install terraform


Verify Installation:

terraform -v

Initialize Terraform
terraform init


Downloads provider plugins

Sets up the working directory

2. Terraform Core Commands
Format & Validate Code
terraform fmt       # Formats Terraform code
terraform validate  # Validates Terraform syntax

Plan & Apply Infrastructure
terraform plan                  # Shows execution plan without applying
terraform apply                 # Creates/updates infrastructure
terraform apply -auto-approve   # Applies without manual confirmation

Destroy Infrastructure
terraform destroy                # Destroys all managed resources
terraform destroy -auto-approve  # Without confirmation

3. Managing Terraform State
Check Current State
terraform state list  # Lists all managed resources
terraform show        # Shows detailed resource info

Manually Modify State
terraform state mv <source> <destination>  # Move resource in state file
terraform state rm <resource>              # Removes resource from state (not from 
