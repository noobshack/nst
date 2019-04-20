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
