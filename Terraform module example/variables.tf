
#### This file contains all the variable which are used in main.tf and other module

### Count for loop the nmber of times

variable "count"{
  type = "string"
}

### VPC names

variable "vpc_names"{
  type = "list"
}

### Bucket Names
variable "bucket_names"{
  type = "list"
}

### Location for bucket
variable "location"{
  type = "string"
}