# resource "aws_s3_bucket" "terraform_state" {
#   bucket = "terraform-cicd"
# }
# resource "aws_s3_bucket_versioning" "terraform_state" {
#   bucket = aws_s3_bucket.terraform_state.id

#   versioning_configuration {
#     status = "Enabled"
#   }
# }

# resource "aws_s3_bucket_server_side_encryption_configuration" "terraform_state" {
#   bucket = aws_s3_bucket.terraform_state.bucket
#   rule {
#     apply_server_side_encryption_by_default {
#       sse_algorithm = "AES256"
#     }
#   }
# } 


# Dynamo DB resource for locking and consistency checking:
#  resource "aws_dynamodb_table" "terraform_locks" {
#   name         = "terraform-cicd-locks"
#   billing_mode = "PAY_PER_REQUEST"
#   hash_key     = "LockID"
#   attribute {
#     name = "LockID"
#     type = "S"
#   }
# }

terraform {
  backend "s3" {
    bucket = "terraformci-cd"
    key    = "global/s3/terraform.tfstate"
    region = "eu-west-2"
  }
}