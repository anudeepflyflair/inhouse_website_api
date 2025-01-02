# # Define the S3 bucket to store Lambda layer files
# resource "aws_s3_bucket" "lambda_layer_bucket" {
#   bucket = "lambda-layer-files-bucket"  
# #   acl    = "private"                    
 
#   tags = {
#     Name        = "Lambda Layer Bucket"
#   }
# }
 
# # Define the S3 object for the Lambda layer file
# resource "aws_s3_bucket_object" "common_dependencies" {
#   bucket = aws_s3_bucket.lambda_layer_bucket.id
#   key    = "lambda_layers/common_dependencies.zip"  
#   source = "./lambda_layer_files/common_dependencies.zip"  
# #   acl    = "private"  
 
#   tags = {
#     Name        = "Common Dependencies Layer"
#   }
# }

resource "aws_s3_bucket" "lambda_layer_bucket" {
  bucket              = "terraform-state-bucket-inhouse-website-api"
#   acl                 = "private"
  force_destroy       = true
  object_lock_enabled = false
  tags = {
    Environment = "Production"
    Name        = "State Bucket"
  }
}
 
# Define the S3 bucket object for Lambda layer dependencies
resource "aws_s3_object" "common_dependencies" {
  bucket                 = aws_s3_bucket.lambda_layer_bucket.bucket
  key                    = "lambda_layers/common_dependencies.zip" # Object key in S3
  server_side_encryption = "AES256"
  source                 = "./lambda_layer_files/common_dependencies.zip" # Ensure file exists locally
  storage_class          = "STANDARD"
  tags = {
    Name       = "Common Lambda Layer"
    Layer_Type = "Dependencies"
  }
}