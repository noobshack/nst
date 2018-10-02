resource "kubernetes_replication_controller" "ghost" {
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
        image             = "library/ghost:2.1"
        name              = "${local.service}"
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

resource "kubernetes_service" "ghost" {
  metadata {
    name = "ghost"
  }

  spec {
    selector {
      app = "${kubernetes_replication_controller.ghost.metadata.0.labels.app}"
    }

    session_affinity = "ClientIP"

    port {
      port        = 80
      target_port = 2368
    }

    type = "LoadBalancer"

    load_balancer_ip = "${google_compute_address.ghost.address}"
  }
}
