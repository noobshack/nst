terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "noobshack"

    workspaces {
      name = "diviner"
    }
  }
}

# Kubernetes Terraform provider
provider "google" {
  project = "noobshack-164103"
  region  = "us-west2"
}

resource "google_container_cluster" "nsk" {
  name        = "${var.service}"
  region      = "${var.region}"
  description = "GKE cluster for ${var.service}"

  initial_node_count       = 1
  remove_default_node_pool = true

  addons_config {
    http_load_balancing {
      disabled = true
    }

    horizontal_pod_autoscaling {
      disabled = true
    }

    kubernetes_dashboard {
      disabled = true
    }
  }

  maintenance_policy {
    daily_maintenance_window {
      start_time = "03:00"
    }
  }

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
  node_count = 0

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

resource "google_container_node_pool" "dedicated" {
  name       = "${var.service}-dedicated"
  region     = "${var.region}"
  cluster    = "${google_container_cluster.nsk.name}"
  node_count = 1

  node_config {
    preemptible  = false
    machine_type = "n1-highmem-2"

    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}
