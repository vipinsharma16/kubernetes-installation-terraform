resource "aws_dynamodb_table" "dynamodb-terraform-state-lock" {
  name = "terraform-state-lock-dynamo"
  billing_mode     = "PAY_PER_REQUEST"
  hash_key = "LockID"
 
  attribute {
    name = "LockID"
    type = "S"
  }
}