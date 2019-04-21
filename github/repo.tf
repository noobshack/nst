/*
    GitHub Repository Management
*/

// Repositories
resource "github_repository" "nst" {
  name         = "nst"
  description  = "noobshack Terraform repository, managed by Terraform."
  homepage_url = "http://noobshack.com"

  private = false
}

// Repository Webhooks
resource "github_repository_webhook" "atlantis" {
  repository = "${github_repository.nst.name}"
  name       = "atlantis"

  configuration {
    url          = "http://atlantis.noobshack.net/events"
    content_type = "json"
    secret       = "${var.github_webhook_secret_nst}"
    insecure_ssl = false
  }

  active = true

  events = ["PullRequestReviewEvent", "PushEvent", "IssueCommentEvent", "PullRequestEvent"]
}

resource "github_repository_webhook" "discord" {
  repository = "${github_repository.nst.name}"
  name       = "noobshack-discord-diviner"

  configuration {
    url          = "https://discordapp.com/api/webhooks/569640627239649282/${var.discord_token}/github"
    content_type = "json"
    insecure_ssl = false
  }

  active = true

  events = ["PushEvent"]
}
