terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "noobshack"

    workspaces {
      name = "vault"
    }
  }
}

provider "kubernetes" {
  config_context_cluster = "nsk"
}

/*
    Pod
*/

resource "kubernetes_replication_controller" "vault" {
  metadata {
    name      = "${local.service}"
    labels    = "${var.labels}"
    namespace = "default"
  }

  spec {
    replicas = 1

    selector {
      app = "${local.service}"
    }

    template {
      container {
        image             = "library/vault:0.9.5"
        name              = "${local.service}"    // DNS_LABEL for the pod example.cluster.local
        image_pull_policy = "Always"

        resources {
          limits {
            cpu    = "0.5"
            memory = "512Mi"
          }

          requests {
            cpu    = "250m"
            memory = "50Mi"
          }
        }
      }
    }
  }
}

/*
    Config Map
*/

resource "kubernetes_config_map" "vault" {
  metadata {
    name      = "${local.service}"
    labels    = "${var.labels}"
    namespace = "default"
  }

  data {
    foo = "bar"
  }
}
