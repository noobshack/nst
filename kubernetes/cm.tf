resource "kubernetes_config_map" "example" {
  metadata {
    name = "my-config"
  }

  data {
    api_host = "myhost:443"
    db_host  = "dbhost:5432"
  }
}
