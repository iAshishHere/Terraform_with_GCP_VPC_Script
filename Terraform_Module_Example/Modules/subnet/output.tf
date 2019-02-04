
#### Out of the subnet module
output "subnet_id" {
  value = "${google_compute_subnetwork.network-with-private-secondary-ip-ranges.*.name}"
}
