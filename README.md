# Terraform_with_GCP_VPC_Script
This is an example for how to create modules in terraform and make terraform script more reusable. 

This script has 2 modules
1. VPC Module
2. CloudStorage Module

#########
VPC Module - It creates 3 VPC and 1 Subnet in each VPC with compute engine running on each subnet


#########
CloudStorage Module - It creates 3 buckets in the google cloud storage


Change the default values in variables.tf file as per your requirements.

NOTE : You need to provide your serviceaccount.json, I am not providing mine, because it is a sensitive data and suggest you the same


Prerequisite - 
1) Install Terraform latest version 

How to make this script runnable on your local : 
1) Clone this repository 
2) Open CMD form the folder "Terraform module example" and execute the following command:
    - Terraform init
    - Terraform Plan
    - Terraform apply -var-file=param.tfvars 
