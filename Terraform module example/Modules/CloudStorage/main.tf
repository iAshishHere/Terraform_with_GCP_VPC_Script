
### It loop over the count and list bucket_names and create 3 different buckets in google cloud storage

resource "google_storage_bucket" "image-store" {
  count    = "${var.count}"
  name     = "${element(var.bucket_names, count.index)}"
  location = "${var.location}"
}
