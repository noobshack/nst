terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "noobshack"

    workspaces {
      name = "dns"
    }
  }
}

provider "cloudflare" {
  email = "${var.cloudflare_email}"
  token = "${var.cloudflare_token}"
}

# Redirect thoriam.com --> thoriumtatical.com
resource "cloudflare_record" "thoriam_thoriumtactical" {
  domain = "${var.thoriam_com}"
  name   = ""
  value  = "thoriumtactical.com"
  type   = "CNAME"
  ttl    = 300
}
