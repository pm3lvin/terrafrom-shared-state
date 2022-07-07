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

resource "aws_iam_user" "test" {
  name = data.terraform_remote_state.state-1.outputs.local

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
