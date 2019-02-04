###################################
# @uthor: Ashish Kumar
# DATE: 2/Feb/2019
###################################


####################################
# Configuring the provider as GCP
####################################

provider "google" {
  credentials = "./serviceaccount.json"
  project     = "pandora-resource"
  region      = "us-central1"
}


####################################
# Configuring backend
####################################

terraform {
  backend "gcs" {
    bucket  = "ashish-g-tf-state-bucket"
    prefix  = "terraform/state"
    credentials = "./serviceaccount.json"
  } 
}

####################################
# Module for VPC - It creates 3 VPC
####################################
module "vpc" {
  source = "Modules/VPC"
  count  = "${var.count}"
  vpc_names   = "${var.vpc_names}"
}

####################################
# Module for Subnet - It creates 1 subnet in all the 3 custom VPC
####################################
module "subnet" {
  source = "Modules/subnet"
  count  = "${var.count}"
  subnet_names   = "${var.subnet_names}"
  vpc_names   = "${module.vpc.vpc_id}" 
}

####################################
# Module for Compute Engine - It creates compute engine in all the subnet
####################################

module "compute-engine" {
  source = "Modules/compute-engine"
  count  = "${var.count}"
  vm_names   = "${var.vm_names}"
  subnet_names   = "${module.subnet.subnet_id}"
}


####################################
# Module for Creatin Bucket - It creates 3 buckets in a specified location
####################################

module "gcs" {
  source = "Modules/CloudStorage"
  count  = "${var.count}"
  bucket_names   = "${var.bucket_names}"
  location = "${var.location}"
}