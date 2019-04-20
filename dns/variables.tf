// Cloudflare provider - injected vars
variable "cloudflare_email" {}
variable "cloudflare_token" {}

// Local reference to this Terraform service
variable "service" {
  type    = "string"
  default = "dns"
}

/*
  Cloudflare domains
*/
variable "thoriam_com" {
  description = "thoriam.com"
  type = "string"
  default = "thoriam.com"
}

variable "noobshack_com" {
  description = "noobshack.com"
  type = "string"
  default = "noobshack.com"
}

variable "noobshack_net" {
  description = "noobshack.net"
  type = "string"
  default = "noobshack.net"
}
