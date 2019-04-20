terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "noobshack"

    workspaces {
      name = "github"
    }
  }
}

// Configure GitHub provider
provider "github" {
  token        = "${var.github_token}"
  organization = "${var.github_organization}"
}
