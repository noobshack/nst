locals {
  service = "mordhau"

  project = "noobshack-164103"
  region  = "us-west1"
  zone    = "us-west1-a"

  ubuntu_xenial_image = "ubuntu-1604-xenial-v20190212"
  servers             = 1

  #https://hub.docker.com/r/cm2network/mordhau/tags
  mordhau_version = "latest"

  // Prevent IP conflicts with other GCloud services, will allow communication to Memorystore
  internal_ips = {
    "0" = "10.142.13.37"
  }

  // external_ips = {
  //   "0" = "${google_compute_address.mordhau_external.address}"
  // }
}
