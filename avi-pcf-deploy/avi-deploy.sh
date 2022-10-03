#!/bin/bash
# Cloning Repository
git clone https://github.com/ralvianus/terraform-avi -b corp-vmw
git clone https://github.com/ralvianus/terraform-nsxt

# Deploy AVI Controller
cd ~/terraform-avi/phase0-deploy
terraform init
terraform plan
terraform apply --auto-approve
sleep 30

# Configure NSX-T Cloud
cd ~/terraform-nsxt/pcf-lab-topology
terraform init
terraform plan
terraform apply --auto-approve
sleep 10
cd ~/terraform-avi/phase1-nsxt-cloud
terraform init
terraform plan
terraform apply --auto-approve
sleep 30

# Configure DNS VS
cd ~/terraform-avi/phase2-nsxt-dns
terraform init
terraform plan
terraform apply --auto-approve
sleep 30

# Configure PCF VS
cd ~/terraform-avi/phase2-pcf
terraform init
terraform plan
terraform apply --auto-approve
sleep 30
