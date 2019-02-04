
#### This file contains all the variable which are used in main.tf and other module

### Count for loop the number of times

variable "count"{
  type = "string"
}

variable "vpc_names"{
  type = "list"
}

variable "subnet_names"{
  type = "list"
}

variable "vm_names"{
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
