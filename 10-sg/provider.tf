terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.16.0"
    }
  }
  backend "s3" {
    bucket = "terraform-backend-86"
    key    = "roboshop-eks-jenkins-sg"
    region = "us-west-2"
    use_lockfile = true
  }
}

provider "aws" {
  # Configuration options
  region = "us-west-2"
}