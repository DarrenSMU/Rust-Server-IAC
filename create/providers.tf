terraform {
    backend "local" {}
}

terraform {
    required_version = ">= 1.0.0"
    required_providers {
        aws = {
          source  = "hashicorp/aws"
          version = "3.50.0"
        }
        local = {
            source  = "hashicorp/local"
            version = "2.1.0"
        }
    }
}

provider "aws" {
    region = var.region
}