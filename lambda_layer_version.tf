# Define the Lambda layer for Python runtimes 3.9, 3.10, 3.11, and 3.12
resource "aws_lambda_layer_version" "lambda_layer" {
  layer_name          = "python_dependencies_layer"
  compatible_runtimes = ["python3.9", "python3.10", "python3.11", "python3.12"]  
  s3_bucket           = aws_s3_bucket.lambda_layer_bucket.id
  s3_key              = aws_s3_bucket_object.common_dependencies.key  
  description         = "Layer for Python dependencies compatible with Python 3.9, 3.10, 3.11, and 3.12 runtimes"
}


