// Injected secrets
variable "github_token" {}

variable "github_webhook_secret_nst" {}

variable "discord_token" {
  type    = "string"
  default = "pqrCQkBNugpDilBCTvzcqY31tPcWGHUjMJ22KLOlkIwS_tDq8dSJvSYN-y5ZNUnJhUh9"
}

// Provider variables
variable "github_organization" {
  type    = "string"
  default = "noobshack"
}

// Member lists
variable "github_owners" {
  description = "List of noobshack owners."
  type        = "list"
  default     = ["mpmsimo", "noobshackbot"]
}

variable "github_members" {
  description = "List of noobshack members."
  type        = "list"
  default     = ["mzamani1", "rangoris", "cynize", "jrsimo91"]
}
