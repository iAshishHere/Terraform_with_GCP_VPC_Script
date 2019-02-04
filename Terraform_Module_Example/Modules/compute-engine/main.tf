##########################################
# Creation of compute-engine in each subnet ( which we created in subnet module)
##########################################

resource "google_compute_instance" "default" {
  count    = "${var.count}"
  name     = "${element(var.vm_names, count.index)}"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"

  tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    subnetwork       ="${element(var.subnet_names, count.index)}"
  }
}