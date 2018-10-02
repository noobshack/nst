variable "labels" {
  type = "map"

  default = {
    app = "ghost"
  }
}

variable "region" {
  description = "GCP region to create the resource in."
  type        = "string"
  default     = "us-west1-a"
}

locals {
  service = "ghost"
  project = "noobshack-164103"
}
