##########################################
# VPC Creation
##########################################


resource "google_compute_network" "custom-test" {
 count    = "${var.count}"
 name     = "${element(var.vpc_names, count.index)}"
 auto_create_subnetworks = "false"
}

##########################################
# Subnet Creation inside each VPC
##########################################

resource "google_compute_subnetwork" "network-with-private-secondary-ip-ranges" {
  #name          = "test-subnetwork"
  name          ="${element(var.vpc_names, count.index)}-subnetwork"
  ip_cidr_range = "10.2.0.0/16"
  region        = "us-central1"
  count         = 3
  network       = "${element(var.vpc_names, count.index)}"
  #network       = "${google_compute_network.custom-test.self_link}"
  secondary_ip_range {
    range_name    = "tf-test-secondary-range-update1"
    ip_cidr_range = "192.168.10.0/24"
  }
  depends_on=["google_compute_network.custom-test"]
}

##########################################
# Compute engine in each subnet
##########################################

resource "google_compute_instance" "default" {
  name         = "test"
  count         = 3
  name          ="${element(var.vpc_names, count.index)}-vm-engine"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"

  tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    #subnetwork       = "${google_compute_subnetwork.network-with-private-secondary-ip-ranges.name}"
    subnetwork       ="${element(var.vpc_names, count.index)}-subnetwork"
  }
  depends_on=["google_compute_subnetwork.network-with-private-secondary-ip-ranges"]
}