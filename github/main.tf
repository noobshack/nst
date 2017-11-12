// Configure GitHub provider
provider "github" {
  token        = "${var.github_token}"
  organization = "${var.github_organization}"
}

/*
    GitHub Organization Management
*/

// Member lists
variable "github_owners" {
  description = "List of noobshack owners."
  type        = "list"
  default     = ["mpmsimo", "noobshackbot"]
}

variable "github_members" {
  description = "List of noobshack members."
  type        = "list"
  default     = ["rangoris"]
}

// User role association
resource "github_membership" "owners" {
  count    = "${length(var.github_owners)}"
  username = "${element(var.github_owners, count.index)}"
  role     = "owner"
}

resource "github_membership" "members" {
  count    = "${length(var.github_members)}"
  username = "${element(var.github_members, count.index)}"
  role     = "member"
}

// Team Management
resource "github_team" "operations" {
  name        = "operations"
  description = "noobshack operations"
  privacy     = "closed"
}


/*
    GitHub Resource Management
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
