resource "cloudflare_record" "ghost" {
  domain = "mpmsimo.com"
  name   = "@"
  value  = "${google_compute_address.ghost.address}"
  type   = "A"
  ttl    = 3600
}
