variable "labels" {
  type = "map"

  default = {
    app = "vault"
  }
}

locals {
  service = "vault"
}
