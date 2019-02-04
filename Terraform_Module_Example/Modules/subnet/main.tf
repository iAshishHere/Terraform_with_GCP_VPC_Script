##########################################
# Subnet Creation inside each VPC (Which we created in vpc module)
##########################################

resource "google_compute_subnetwork" "network-with-private-secondary-ip-ranges" {
  count    = "${var.count}"
  name          ="${element(var.subnet_names, count.index)}"
  ip_cidr_range = "10.2.0.0/16"
  region        = "us-central1"
  network       = "${element(var.vpc_names, count.index)}"
  secondary_ip_range {
    range_name    = "tf-test-secondary-range-update1"
    ip_cidr_range = "192.168.10.0/24"
  }
}

