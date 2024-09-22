terraform {
  backend "s3" {
     bucket = "terraformbackend-terraform"
     key = "terraform/terraform.tfstate"
     dynamodb_table = "terraform-state-lock-dynamo"
     region = "ap-south-1"
  }
}

