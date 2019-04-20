terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "noobshack"

    workspaces {
      name = "ghost"
    }
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
