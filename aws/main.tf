terraform {
  required_version = ">= 0.10.0"

  backend "s3" {
    bucket = "noobshack-terraform"
    key = "atlantis/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  access_key = "${var.aws_access_key_id}"
  secret_key = "${var.aws_secret_access_key}"
  region     = "us-east-1"
}

# Terraform S3 Backend
resource "aws_s3_bucket" "noobshack-terraform" {
  bucket = "noobshack-terraform"
  acl = "private"

  tags {
    managed_by = "terraform"
  }

  lifecycle {
    prevent_destroy = true
  }
}
