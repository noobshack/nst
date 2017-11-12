resource google_compute_instance "nsdev" {
  name         = "nsdev"
  description  = "A micro noobshack development server"
  machine_type = "f1-micro"
  zone         = "${var.gcp_region}"

  tags = ["development", "test"]

  boot_disk {
    initialize_params {
        image = "ubuntu-1604-xenial-v20170328"
    }
  }
   
  network_interface {
    network = "ns-network"

    access_config {}
  }

  metadata {
    created_by = "terraform"
  }

  metadata_startup_script = "echo hi > /test.txt"

  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }

  scheduling {
    automatic_restart = "true"
  }
}

resource "google_compute_network" "ns_network" {
  name                    = "ns-network"
  description             = "The main network and subnets for the noobshack infrastructure"
  auto_create_subnetworks = "true"
}

resource "google_compute_firewall" "ns_firewall" {
  name        = "webserver"
  description = "Security and firewall rules for the noobshack network"
  network     = "${google_compute_network.ns_network.name}"

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "1000-2000", "22"]
  }

  source_tags = ["web"]
}
