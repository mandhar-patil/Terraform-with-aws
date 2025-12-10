# Terraform In One Shot 🚀

This repository is your **one-stop solution for Terraform** for DevOps Engineers.  
Learn Terraform commands, modules, state management, and best practices in one place.

---

## Setup & Initialization

### Install Terraform

#### Linux & macOS
```bash
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install terraform

Verify Installation
terraform -v
