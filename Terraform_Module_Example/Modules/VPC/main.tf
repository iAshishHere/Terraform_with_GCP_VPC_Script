##########################################
# VPC Creation
##########################################

resource "google_compute_network" "custom-test" {
 count    = "${var.count}"
 name     = "${element(var.vpc_names, count.index)}"
 auto_create_subnetworks = "false"
}