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

terraform {
  backend "s3" {
    bucket = "state-822924082960"
    key    = "testing/state-1"
    region = "eu-west-1"
  }
}

locals {
  catalogs = {

    "sandbox" = {
      comment = "this catalog is managed by terraform"
      name    = "sandbox"
      purpose = "learning"
    },
    "dev" = {
      comment = "this catalog is managed by terraform"
      name    = "dev"
      purpose = "development"
    },
    "stage" = {
      comment = "this catalog is managed by terraform"
      name    = "stage"
      purpose = "testing"
    },
    "prod" = {
      comment = "this catalog is managed by terraform"
      name    = "prod"
      purpose = "production"
    }
  }
}


locals {
  name = "bob"
}

