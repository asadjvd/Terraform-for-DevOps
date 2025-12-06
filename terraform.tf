terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = ">= 6.0.0"
    }
  }

  backend "s3" {
    bucket = "tf-state-bucket-practice-asad"
    key = "terraform.tfstate"
    region = "us-east-2"
    dynamodb_table = "tf-state-table"
  }
}

