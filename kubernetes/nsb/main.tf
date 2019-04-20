terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "noobshack"

    workspaces {
      name = "nsb"
    }
  }
}

# Kubernetes Terraform provider
provider "kubernetes" {
  config_context_auth_info = "ops"
  config_context_cluster   = "nsk-central1"
}

resource "kubernetes_namespace" "atlantis" {
  metadata {
    name = "my-first-namespace"
  }
}
