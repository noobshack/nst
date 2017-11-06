resource "kubernetes_service" "example" {
  metadata {
    name = "terraform-example"
  }

  spec {
    selector {
      app = "${kubernetes_pod.example.metadata.0.labels.app}"
    }

    session_affinity = "ClientIP"
    port {
      port = 8080
      target_port = 80
    }

    type = "LoadBalancer"

  }
}

resource "kubernetes_pod" "atlantis" {

  metadata {
    name = "atlantis"

    labels {
      app = "atlantis"
      component = "tf"
    }
  }

  spec {
    container {
      image = "hootsuite:latest"
      name  = "atlantis"
    }

  }
}
