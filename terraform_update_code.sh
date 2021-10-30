#!/bin/bash

terraform init -backend-config=environments/demo/backend.config
terraform plan -var-file=environments/demo/variables.tfvars
terraform apply -var-file=environments/demo/variables.tfvars --auto-approve=true
terraform destroy -var-file=environments/demo/variables.tfvars  --auto-approve=true
