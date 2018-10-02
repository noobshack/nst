resource "google_compute_address" "ghost" {
  name         = "${local.service}"
  address_type = "EXTERNAL"
  network_tier = "PREMIUM"
  project      = "noobshack-164103"
  region       = "us-west1"
}
