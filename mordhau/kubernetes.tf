resource "kubernetes_deployment" "mordhau" {
  metadata {
    name = "${local.service}"

    labels {
      app = "${local.service}"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels {
        app = "${local.service}"
      }
    }

    template {
      metadata {
        labels {
          app = "${local.service}"
        }
      }

      spec {
        host_network = true

        container {
          image = "gcr.io/${local.project}/mordhau:${local.mordhau_version}"
          name  = "${local.service}"

          resources {
            limits {
              cpu    = "2"
              memory = "2048Mi"
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
}

/*
resource "kubernetes_endpoints" "mordhau" {
  metadata {
    name = "${local.service}"

    labels {
      app = "${local.service}"
    }
  }

  subset {
    address {
      ip = ""
    }

    port {
      name     = "http"
      port     = 80
      protocol = "TCP"
    }

    port {
      name     = "https"
      port     = 443
      protocol = "TCP"
    }

    port {
      name     = "http"
      port     = 80
      protocol = "TCP"
    }
  }
}
*/

resource "kubernetes_service" "mordhau" {
  metadata {
    name = "${local.service}"

    labels {
      app = "${local.service}"
    }
  }

  spec {
    selector {
      app = "${kubernetes_deployment.mordhau.metadata.0.labels.app}"
    }

    session_affinity = "ClientIP"

    type = "LoadBalancer"

    port {
      name        = "gameserver"
      port        = 7777
      target_port = 7777
    }

    port {
      name        = "queryport"
      port        = 27015
      target_port = 27015
    }

    port {
      name        = "beaconport"
      port        = 15000
      target_port = 15000
    }
  }
}
