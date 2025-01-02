# Define the IAM Role
resource "aws_iam_role" "jwt_token_role" {
  name = "JWTtoken_Website_Dev-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
        Effect = "Allow"
        Sid    = ""
      }
    ]
  })
}
 
# Attach the AdministratorAccess Policy to the IAM Role
resource "aws_iam_role_policy_attachment" "administrator_access_policy" {
  role       = aws_iam_role.jwt_token_role.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
 
# Attach the AWSLambdaBasicExecutionRole Policy to the IAM Role
resource "aws_iam_role_policy_attachment" "lambda_basic_execution_policy" {
  role       = aws_iam_role.jwt_token_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}