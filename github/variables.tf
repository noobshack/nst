// Member lists
variable "github_owners" {
  description = "List of noobshack owners."
  type        = "list"
  default     = "${local.github_owner_list}"
}

variable "github_members" {
  description = "List of noobshack members."
  type        = "list"
  default     = "${local.github_member_list}"
}

locals {
  github_owner_list = ["mpmsimo", "noobshackbot"]
  github_member_list = ["mzamani1", "rangoris", "cynize", "jrsimo91"]
}

