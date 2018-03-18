/*
    Terraform Block
*/

terraform {
  backend "gcs" {
    bucket  = "noobshack-terraform-state"
    prefix  = "nsk"
  }
}

provider "google" {
  region = "${var.region}"
  project = "${local.project}"
}

/*
    Google Kubernetes Cluster
*/

resource "google_container_cluster" "nsk" {
  name        = "${local.service}"
  zone        = "${var.region}"
  description = "GKE cluster for ${local.service}"

  initial_node_count = 1

  additional_zones = "${var.additional_zones}"

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
    machine_type    = "${var.machine_type}"
    disk_size_gb    = "${var.disk_size_gb}"
    local_ssd_count = "0"

    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

    labels {
      managed_by = "terraform"
      service    = "${local.service}"
    }

    tags = ["${local.service}"]

    service_account = ""
  }
}
