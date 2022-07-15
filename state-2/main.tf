terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.21.0"
    }
  }
}


provider "aws" {
  region = "eu-west-1"
}

variable "create_iam_user" {
  #  true of false
  default = "true"
}


resource "aws_iam_user" "test" {
  count = var.create_iam_user ? 1 : 0
  name  = data.terraform_remote_state.state-1.outputs.local

  tags = {
    tag-key = "tag-value"
  }
}

data "terraform_remote_state" "state-1" {
  backend = "s3"
  config = {
    bucket = "state-822924082960"
    key    = "testing/state-1"
    region = "eu-west-1"
  }
}

# local backend
#data "terraform_remote_state" "state-1" {
#  backend = "local"
#
#  config = {
#    path = "${path.module}/../state-1/terraform.tfstate"
#  }
#}
#
#variable "oidc_federated_account" {
#  type = map(map)
#  default = {
#    dev = {
#      account_number = "789457496470"
#      create_oidc     = true
#    }
#    stage = {
#      account_number = ""
#      create_oidc     = true
#    }
#    prod = {
#      account_number = "134689845371"
#      create_oidc     = true
#    }
#  }
#}