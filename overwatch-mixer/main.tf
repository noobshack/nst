terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "noobshack"

    workspaces {
      name = "overwatch_mixer"
    }
  }
}

provider "google" {
  project = "${local.project}"
}

resource "google_storage_bucket" "bucket" {
  name          = "${local.bucket}"
  location      = "US"
  storage_class = "MULTI_REGIONAL"

  versioning {
    enabled = true
  }

  website {
    main_page_suffix = "overwatch.html"
    not_found_page   = "404.html"
  }
}
