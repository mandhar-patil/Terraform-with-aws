Terraform for DevOps Engineers

This repository is your one-stop solution for learning and using Terraform for DevOps engineers.

1. Setup & Initialization
Install Terraform
For Linux & macOS:
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install terraform

Verify Installation
terraform -v
