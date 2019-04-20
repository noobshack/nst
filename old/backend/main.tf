# Resource needs to be cleaned up and then removed.
terraform {
  backend "gcs" {
    bucket  = "noobshack-terraform-state"
    prefix  = "backend"
  }
}

provider "google" {
  project = "${local.project}"
}

resource "google_storage_bucket" "backend" {
  name     = "noobshack-terraform-state"
  location = "US"
  storage_class = "MULTI_REGIONAL"

  versioning {
     enabled = true
  }
}
