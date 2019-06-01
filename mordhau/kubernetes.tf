resource "kubernetes_deployment" "mordhau" {
  metadata {
    name = "${local.service}"

    labels {
      app = "${local.service}"
    }
  }

  spec {
    replicas = 3

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
        container {
          image = "cm2network/mordhau:${local.mordhau_version}"
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

resource "kubernetes_service" "mordhau" {
  metadata {
    name = "mordhau"
  }

  spec {
    selector {
      app = "${kubernetes_deployment.mordhau.metadata.0.labels.app}"
    }

    session_affinity = "ClientIP"

    port {
      port        = 80
      target_port = 2368
    }

    type = "LoadBalancer"

    load_balancer_ip = "${google_compute_address.mordhau_external.address}"
  }
}
