
##########################################
# Bucket creation
##########################################

resource "google_storage_bucket" "image-store" {
  count    = "${var.count}"
  name     = "${element(var.bucket_names, count.index)}"
  location = "${var.location}"
}
