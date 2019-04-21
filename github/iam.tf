/*
    GitHub Organization Management
*/

// User role association
resource "github_membership" "owners" {
  count = "${length(var.github_owners)}"

  username = "${element(var.github_owners, count.index)}"
  role     = "admin"
}

resource "github_membership" "members" {
  count = "${length(var.github_members)}"

  username = "${element(var.github_members, count.index)}"
  role     = "member"
}

// Team Management
resource "github_team" "operations" {
  name        = "operations"
  description = "noobshack operations"
  privacy     = "closed"
}
