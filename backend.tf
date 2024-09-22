     backend "s3" {
     bucket = "terraform-backend-bucket"
     key = "terraform/terraform.tfstate"
     dynamodb_table = "terraform-state-lock-dynamo"
     region = "ap-south-1"
   }

