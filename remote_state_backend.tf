resource "aws_s3_bucket" "terraform_state" {
  bucket = "terraform-state-bucket-inhouse-website-api"
  acl    = "private"
 
  versioning {
    enabled = true
  }
 
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = "terraform-state-locks-inhouse-website-api"
  billing_mode = "PAY_PER_REQUEST"
 
  attribute {
    name = "LockID"
    type = "S"
  }
 
  hash_key = "LockID"
}

terraform {
  backend "s3" {
	bucket     	= "terraform-state-bucket-inhouse-website-api"
	key        	= "state/statefile.tfstate"
	region     	= "${var.aws_region}"
	encrypt    	= true
	dynamodb_table = "terraform-state-locks-inhouse-website-api"
  }
}