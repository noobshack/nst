/*
    Google Provider
*/

variable "region" {
  description = "GCP region to create the resource in."
  type        = "string"
  default     = "us-west1-a"
}

/*
    Google Container Cluster
*/

variable "additional_zones" {
  description = "Additional availability zones that correlate with the master region."
  default = [ "us-west1-b", "us-west1-c", ]
  type = "list"
}

variable "machine_type" {
  description = "VM type to create for the gke-cluster."
  type        = "string"
  default     = "f1-micro"
}

variable "disk_size_gb" {
  description = "The disk size in GB for each node in the cluster."
  type        = "string"
  default     = "10"
}

locals {
  project = "noobshack-164103"
  service = "nsk"
  required_services = [
    "cloudresourcemanager.googleapis.com",
    "cloudbilling.googleapis.com",
    "iam.googleapis.com",
    ".googleapis.com",
    "iam.googleapis.com",
  ]
}

