###################################
# @uthor: Ashish Kumar
###################################


#####Configuring the provider as GCP.

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


##### Creating 3 different VPC, 1 subnet in each and 1 compute engine running on each subnet

module "vpc" {
  source = "Modules/VPC"
  count  = "${var.count}"
  vpc_names   = "${var.vpc_names}"
}


#### Creating 4 buckets in specified location

module "gcs" {
  source = "Modules/CloudStorage"
  count  = "${var.count}"
  bucket_names   = "${var.bucket_names}"
  location = "${var.location}"
}