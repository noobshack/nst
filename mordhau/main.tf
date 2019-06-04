// TF
terraform {
  required_version = "= 0.11.13"

  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "noobshack"

    workspaces {
      name = "mordhau"
    }
  }
}

# Kubernetes Terraform provider
provider "kubernetes" {
  config_context_auth_info = "gke_noobshack-164103_us-east1_althea"
  config_context_cluster   = "gke_noobshack-164103_us-east1_althea"
}

provider "google" {
  project = "noobshack-164103"
  region  = "us-west2"
}

data "template_file" "mordhau" {
  template = "${file("mordhau_cloudinit.sh")}"
}

data "google_compute_network" "default" {
  name    = "default"
  project = "${local.project}"
}

data "google_compute_subnetwork" "default" {
  name    = "default"
  project = "${local.project}"
  region  = "${local.region}"
}

/*
resource "google_compute_instance" "mordhau" {
  count = "${local.servers}"

  name         = "${local.service}${count.index+1}"
  zone         = "${local.zone}"
  machine_type = "n1-standard-1"

  boot_disk {
    auto_delete = true

    initialize_params {
      image = "projects/ubuntu-os-cloud/global/images/${local.ubuntu_xenial_image}"
      size  = 15
      type  = "pd-standard"
    }
  }

  network_interface {
    subnetwork = "${data.google_compute_subnetwork.default.self_link}"

    network_ip = "${lookup(local.internal_ips, count.index)}"

    access_config {
      nat_ip = "${lookup(local.external_ips, count.index)}"
    }
  }

  scheduling {
    preemptible = false
  }

  metadata {
    enable-oslogin = "TRUE"
  }

  metadata_startup_script = "${data.template_file.mordhau.rendered}"

  tags = ["${local.service}"]

  labels = {
    managed_by = "terraform"
  }
}

resource "google_compute_firewall" "mordhau" {
  name        = "${local.service}-${local.region}"
  network     = "${data.google_compute_network.default.self_link}"
  target_tags = ["${local.service}"]

  allow {
    protocol = "tcp"
  }

  allow {
    protocol = "udp"
    ports    = ["1194"]
  }

  priority = 777
}

resource "google_compute_address" "mordhau_internal" {
  name         = "${local.service}-internal"
  address_type = "INTERNAL"
  address      = "${lookup(local.internal_ips, 0)}"

  #subnetwork   = "${data.google_compute_subnetwork.default.self_link}"
}

resource "google_compute_address" "mordhau_external" {
  name         = "${local.service}-external"
  address_type = "EXTERNAL"
  network_tier = "PREMIUM"
}
*/

