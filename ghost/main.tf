terraform {
  backend "gcs" {
    bucket = "noobshack-terraform-state"
    prefix = "ghost"
  }
}

provider "google" {
  region  = "${var.region}"
  project = "noobshack-164103"
}

provider "kubernetes" {
  config_context_cluster = "nsk"
}

provider "cloudflare" {
  email = "mpmsimo@gmail.com"
}
