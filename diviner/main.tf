# Kubernetes Terraform provider
provider "google" {
  project = "noobshack-164103"
  region  = "us-west2"
}

resource "google_container_cluster" "nsk" {
  name   = "${var.service}"
  region = "${var.region}"

  remove_default_node_pool = true

  initial_node_count = 1

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

    labels = {
      managed_by = "terraform"
    }

    tags = ["noobshack", "${var.service}"]
  }
}

resource "google_container_node_pool" "preemptible" {
  name       = "${var.service}-preemptible"
  region     = "${var.region}"
  cluster    = "${google_container_cluster.nsk.name}"
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = "f1-micro"

    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}
