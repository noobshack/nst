// Injected secrets
variable "github_token" {}

variable "github_webhook_secret_nst" {}

variable "discord_token" {
  type    = "string"
  default = "vz2a0c7-7AWS_eyOXZH7I8UCVrJVTRjUwvLRO2W_bEZ9IK_Iy4SQQwiTBUISHYm7aNmF"
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
