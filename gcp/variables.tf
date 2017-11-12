/*
    User settings
*/

//variable "ssh_key" {}

/*
    AWS variables
variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_region" { default = "us-east-1" }

    OpenStack variables
variable "os_user_name" {}
variable "os_tenant_name" {}
variable "os_password" {}
variable "os_auth_url" {}

variable "os_flavor_id" {
  type = "string"
  default = "50"
}

variable "os_image_uuid" {
  type = "string"
  default = "b67b74bc-c3a8-4087-9c28-de02161fdedd"
}

variable "os_image_name" {
  type = "string"
  default = "CoreOS"
}

variable "os_network_name" {
  type = "string"
  default = "public"
}
*/

/*
    Google Cloud Platform variables
*/
variable "gcp_project" {
  type    = "string"
  default = "noobshack-164103"
}

variable "gcp_region" {
  type    = "string"
  default = "us-central1-f"
}
