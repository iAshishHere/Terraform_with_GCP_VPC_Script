
##### output of the vpc module
output "vpc_id" {
  value = "${google_compute_network.custom-test.*.name}"
}
