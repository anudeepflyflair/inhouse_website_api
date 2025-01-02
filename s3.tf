# Define the S3 bucket to store Lambda layer files
resource "aws_s3_bucket" "lambda_layer_bucket" {
  bucket = "lambda-layer-files-bucket"  
#   acl    = "private"                    
 
  tags = {
    Name        = "Lambda Layer Bucket"
  }
}
 
# Define the S3 object for the Lambda layer file
resource "aws_s3_bucket_object" "common_dependencies" {
  bucket = aws_s3_bucket.lambda_layer_bucket.id
  key    = "lambda_layers/common_dependencies.zip"  
  source = "./lambda_layer_files/common_dependencies.zip"  
#   acl    = "private"  
 
  tags = {
    Name        = "Common Dependencies Layer"
  }
}