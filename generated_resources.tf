# resource "aws_lambda_function" "lambdaFunction-dev" {
#   architectures                      = ["x86_64"]
#   code_signing_config_arn            = null
#   description                        = "Configuration semantic validation lambda"
#   filename                           = null
#   function_name                      = "lambdaFunction-dev"
#   handler                            = "validate.handler"
#   image_uri                          = null
#   kms_key_arn                        = null
#   layers                             = []
#   memory_size                        = 512
#   package_type                       = "Zip"
#   publish                            = null
#   replace_security_groups_on_destroy = null
#   replacement_security_group_ids     = null
#   reserved_concurrent_executions     = -1
#   role                               = "arn:aws:iam::888577036740:role/lambdaFunction-dev"
#   runtime                            = "python3.9"
#   s3_bucket                          = null
#   s3_key                             = null
#   s3_object_version                  = null
#   skip_destroy                       = false
#   source_code_hash                   = null
#   tags = {
#     Environment        = "Development"
#     createdbyTerraform = "true"
#   }
#   tags_all = {
#     Environment        = "Development"
#     createdbyTerraform = "true"
#   }
#   timeout = 120
#   ephemeral_storage {
#     size = 512
#   }
#   logging_config {
#     application_log_level = null
#     log_format            = "Text"
#     log_group             = "/aws/lambda/lambdaFunction-dev"
#     system_log_level      = null
#   }
#   tracing_config {
#     mode = "Active"
#   }
# }

# # __generated__ by Terraform
# resource "aws_lambda_function" "baggage" {
#   architectures                      = ["x86_64"]
#   code_signing_config_arn            = null
#   description                        = null
#   filename                           = null
#   function_name                      = "baggage"
#   handler                            = "lambda_function.lambda_handler"
#   image_uri                          = null
#   kms_key_arn                        = null
#   layers                             = []
#   memory_size                        = 128
#   package_type                       = "Zip"
#   publish                            = null
#   replace_security_groups_on_destroy = null
#   replacement_security_group_ids     = null
#   reserved_concurrent_executions     = -1
#   role                               = "arn:aws:iam::888577036740:role/service-role/baggage-role-vhect9mj"
#   runtime                            = "python3.11"
#   s3_bucket                          = null
#   s3_key                             = null
#   s3_object_version                  = null
#   skip_destroy                       = false
#   source_code_hash                   = null
#   tags                               = {}
#   tags_all                           = {}
#   timeout                            = 63
#   ephemeral_storage {
#     size = 512
#   }
#   logging_config {
#     application_log_level = null
#     log_format            = "Text"
#     log_group             = "/aws/lambda/baggage"
#     system_log_level      = null
#   }
#   tracing_config {
#     mode = "PassThrough"
#   }
# }

# # __generated__ by Terraform
# resource "aws_lambda_function" "ancillarySearch" {
#   architectures                      = ["x86_64"]
#   code_signing_config_arn            = null
#   description                        = null
#   filename                           = null
#   function_name                      = "ancillarySearch"
#   handler                            = "lambda_function.lambda_handler"
#   image_uri                          = null
#   kms_key_arn                        = null
#   layers                             = []
#   memory_size                        = 128
#   package_type                       = "Zip"
#   publish                            = null
#   replace_security_groups_on_destroy = null
#   replacement_security_group_ids     = null
#   reserved_concurrent_executions     = -1
#   role                               = "arn:aws:iam::888577036740:role/service-role/JWTtoken_Website_Dev-role-ipskmhm7"
#   runtime                            = "python3.11"
#   s3_bucket                          = null
#   s3_key                             = null
#   s3_object_version                  = null
#   skip_destroy                       = false
#   source_code_hash                   = null
#   tags                               = {}
#   tags_all                           = {}
#   timeout                            = 80
#   ephemeral_storage {
#     size = 512
#   }
#   logging_config {
#     application_log_level = null
#     log_format            = "Text"
#     log_group             = "/aws/lambda/ancillarySearch"
#     system_log_level      = null
#   }
#   tracing_config {
#     mode = "PassThrough"
#   }
# }

# # __generated__ by Terraform
# resource "aws_lambda_function" "Website_Dev_CalenderRates" {
#   architectures                      = ["x86_64"]
#   code_signing_config_arn            = null
#   description                        = null
#   filename                           = null
#   function_name                      = "Website_Dev_CalenderRates"
#   handler                            = "lambda_function.lambda_handler"
#   image_uri                          = null
#   kms_key_arn                        = null
#   layers                             = []
#   memory_size                        = 128
#   package_type                       = "Zip"
#   publish                            = null
#   replace_security_groups_on_destroy = null
#   replacement_security_group_ids     = null
#   reserved_concurrent_executions     = -1
#   role                               = "arn:aws:iam::888577036740:role/service-role/JWTtoken_Website_Dev-role-ipskmhm7"
#   runtime                            = "python3.11"
#   s3_bucket                          = null
#   s3_key                             = null
#   s3_object_version                  = null
#   skip_destroy                       = false
#   source_code_hash                   = null
#   tags                               = {}
#   tags_all                           = {}
#   timeout                            = 15
#   ephemeral_storage {
#     size = 512
#   }
#   logging_config {
#     application_log_level = null
#     log_format            = "Text"
#     log_group             = "/aws/lambda/Website_Dev_CalenderRates"
#     system_log_level      = null
#   }
#   tracing_config {
#     mode = "PassThrough"
#   }
# }

# # __generated__ by Terraform
# resource "aws_lambda_function" "klaviyo_event_dev" {
#   architectures                      = ["x86_64"]
#   code_signing_config_arn            = null
#   description                        = null
#   filename                           = null
#   function_name                      = "klaviyo_event_dev"
#   handler                            = "lambda_function.lambda_handler"
#   image_uri                          = null
#   kms_key_arn                        = null
#   layers                             = []
#   memory_size                        = 128
#   package_type                       = "Zip"
#   publish                            = null
#   replace_security_groups_on_destroy = null
#   replacement_security_group_ids     = null
#   reserved_concurrent_executions     = -1
#   role                               = "arn:aws:iam::888577036740:role/service-role/JWTtoken_Website_Dev-role-ipskmhm7"
#   runtime                            = "python3.12"
#   s3_bucket                          = null
#   s3_key                             = null
#   s3_object_version                  = null
#   skip_destroy                       = false
#   source_code_hash                   = null
#   tags                               = {}
#   tags_all                           = {}
#   timeout                            = 50
#   ephemeral_storage {
#     size = 512
#   }
#   logging_config {
#     application_log_level = null
#     log_format            = "Text"
#     log_group             = "/aws/lambda/klaviyo_event_dev"
#     system_log_level      = null
#   }
#   tracing_config {
#     mode = "PassThrough"
#   }
# }

# # __generated__ by Terraform
# resource "aws_lambda_function" "lowFareoptions_Dev_Website" {
#   architectures                      = ["x86_64"]
#   code_signing_config_arn            = null
#   description                        = null
#   filename                           = null
#   function_name                      = "lowFareoptions_Dev_Website"
#   handler                            = "lambda_function.lambda_handler"
#   image_uri                          = null
#   kms_key_arn                        = null
#   layers                             = []
#   memory_size                        = 128
#   package_type                       = "Zip"
#   publish                            = null
#   replace_security_groups_on_destroy = null
#   replacement_security_group_ids     = null
#   reserved_concurrent_executions     = -1
#   role                               = "arn:aws:iam::888577036740:role/service-role/JWTtoken_Website_Dev-role-ipskmhm7"
#   runtime                            = "python3.11"
#   s3_bucket                          = null
#   s3_key                             = null
#   s3_object_version                  = null
#   skip_destroy                       = false
#   source_code_hash                   = null
#   tags                               = {}
#   tags_all                           = {}
#   timeout                            = 3
#   ephemeral_storage {
#     size = 512
#   }
#   logging_config {
#     application_log_level = null
#     log_format            = "Text"
#     log_group             = "/aws/lambda/lowFareoptions_Dev_Website"
#     system_log_level      = null
#   }
#   tracing_config {
#     mode = "PassThrough"
#   }
# }

# # __generated__ by Terraform
# resource "aws_lambda_function" "addancillary-hoper-dev-web" {
#   architectures                      = ["x86_64"]
#   code_signing_config_arn            = null
#   description                        = null
#   filename                           = null
#   function_name                      = "addancillary-hoper-dev-web"
#   handler                            = "lambda_function.lambda_handler"
#   image_uri                          = null
#   kms_key_arn                        = null
#   layers                             = []
#   memory_size                        = 128
#   package_type                       = "Zip"
#   publish                            = null
#   replace_security_groups_on_destroy = null
#   replacement_security_group_ids     = null
#   reserved_concurrent_executions     = -1
#   role                               = "arn:aws:iam::888577036740:role/service-role/JWTtoken_Website_Dev-role-ipskmhm7"
#   runtime                            = "python3.12"
#   s3_bucket                          = null
#   s3_key                             = null
#   s3_object_version                  = null
#   skip_destroy                       = false
#   source_code_hash                   = null
#   tags                               = {}
#   tags_all                           = {}
#   timeout                            = 90
#   ephemeral_storage {
#     size = 512
#   }
#   logging_config {
#     application_log_level = null
#     log_format            = "Text"
#     log_group             = "/aws/lambda/addancillary-hoper-dev-web"
#     system_log_level      = null
#   }
#   tracing_config {
#     mode = "PassThrough"
#   }
# }

# # __generated__ by Terraform
# resource "aws_lambda_function" "JWTtoken_Website_Dev" {
#   architectures                      = ["x86_64"]
#   code_signing_config_arn            = null
#   description                        = null
#   filename                           = null
#   function_name                      = "JWTtoken_Website_Dev"
#   handler                            = "lambda_function.lambda_handler"
#   image_uri                          = null
#   kms_key_arn                        = null
#   layers                             = ["arn:aws:lambda:ca-central-1:888577036740:layer:PyJWT:1"]
#   memory_size                        = 128
#   package_type                       = "Zip"
#   publish                            = null
#   replace_security_groups_on_destroy = null
#   replacement_security_group_ids     = null
#   reserved_concurrent_executions     = -1
#   role                               = "arn:aws:iam::888577036740:role/service-role/JWTtoken_Website_Dev-role-ipskmhm7"
#   runtime                            = "python3.12"
#   s3_bucket                          = null
#   s3_key                             = null
#   s3_object_version                  = null
#   skip_destroy                       = false
#   source_code_hash                   = null
#   tags                               = {}
#   tags_all                           = {}
#   timeout                            = 10
#   ephemeral_storage {
#     size = 512
#   }
#   logging_config {
#     application_log_level = null
#     log_format            = "Text"
#     log_group             = "/aws/lambda/JWTtoken_Website_Dev"
#     system_log_level      = null
#   }
#   tracing_config {
#     mode = "PassThrough"
#   }
# }

# # __generated__ by Terraform
# resource "aws_lambda_function" "reservationPaymentTransaction_dev_IHW" {
#   architectures                      = ["x86_64"]
#   code_signing_config_arn            = null
#   description                        = null
#   filename                           = null
#   function_name                      = "reservationPaymentTransaction_dev_IHW"
#   handler                            = "lambda_function.lambda_handler"
#   image_uri                          = null
#   kms_key_arn                        = null
#   layers                             = []
#   memory_size                        = 128
#   package_type                       = "Zip"
#   publish                            = null
#   replace_security_groups_on_destroy = null
#   replacement_security_group_ids     = null
#   reserved_concurrent_executions     = -1
#   role                               = "arn:aws:iam::888577036740:role/service-role/JWTtoken_Website_Dev-role-ipskmhm7"
#   runtime                            = "python3.12"
#   s3_bucket                          = null
#   s3_key                             = null
#   s3_object_version                  = null
#   skip_destroy                       = false
#   source_code_hash                   = null
#   tags = {
#     Lamda = "IHW-dev"
#   }
#   tags_all = {
#     Lamda = "IHW-dev"
#   }
#   timeout = 150
#   ephemeral_storage {
#     size = 512
#   }
#   logging_config {
#     application_log_level = null
#     log_format            = "Text"
#     log_group             = "/aws/lambda/reservationPaymentTransaction_dev_IHW"
#     system_log_level      = null
#   }
#   tracing_config {
#     mode = "PassThrough"
#   }
# }

# # __generated__ by Terraform
# resource "aws_lambda_function" "voucherCode" {
#   architectures                      = ["x86_64"]
#   code_signing_config_arn            = null
#   description                        = null
#   filename                           = null
#   function_name                      = "voucherCode"
#   handler                            = "lambda_function.lambda_handler"
#   image_uri                          = null
#   kms_key_arn                        = null
#   layers                             = []
#   memory_size                        = 128
#   package_type                       = "Zip"
#   publish                            = null
#   replace_security_groups_on_destroy = null
#   replacement_security_group_ids     = null
#   reserved_concurrent_executions     = -1
#   role                               = "arn:aws:iam::888577036740:role/service-role/JWTtoken_Website_Dev-role-ipskmhm7"
#   runtime                            = "python3.12"
#   s3_bucket                          = null
#   s3_key                             = null
#   s3_object_version                  = null
#   skip_destroy                       = false
#   source_code_hash                   = null
#   tags                               = {}
#   tags_all                           = {}
#   timeout                            = 3
#   environment {
#     variables = {
#       API_URL     = "https://flairair-api.intelisystraining.ca/RESTv1/vouchers/Generate?{fields}  "
#       PASSWORD    = "APIGATE"
#       USERNAME    = "Flair123$"
#       VOUCHER_KEY = "aƒJj2ImKybdP8tQcem2rUqODpzveNdvDKwoL3l¥DYg8="
#     }
#   }
#   ephemeral_storage {
#     size = 512
#   }
#   logging_config {
#     application_log_level = null
#     log_format            = "Text"
#     log_group             = "/aws/lambda/voucherCode"
#     system_log_level      = null
#   }
#   tracing_config {
#     mode = "PassThrough"
#   }
# }

# # __generated__ by Terraform
# resource "aws_lambda_function" "flightSearch" {
#   architectures                      = ["x86_64"]
#   code_signing_config_arn            = null
#   description                        = null
#   filename                           = null
#   function_name                      = "flightSearch"
#   handler                            = "lambda_function.lambda_handler"
#   image_uri                          = null
#   kms_key_arn                        = null
#   layers                             = []
#   memory_size                        = 128
#   package_type                       = "Zip"
#   publish                            = null
#   replace_security_groups_on_destroy = null
#   replacement_security_group_ids     = null
#   reserved_concurrent_executions     = -1
#   role                               = "arn:aws:iam::888577036740:role/service-role/JWTtoken_Website_Dev-role-ipskmhm7"
#   runtime                            = "python3.11"
#   s3_bucket                          = null
#   s3_key                             = null
#   s3_object_version                  = null
#   skip_destroy                       = false
#   source_code_hash                   = null
#   tags                               = {}
#   tags_all                           = {}
#   timeout                            = 8
#   ephemeral_storage {
#     size = 512
#   }
#   logging_config {
#     application_log_level = null
#     log_format            = "Text"
#     log_group             = "/aws/lambda/flightSearch"
#     system_log_level      = null
#   }
#   tracing_config {
#     mode = "PassThrough"
#   }
# }

# # __generated__ by Terraform
# resource "aws_lambda_function" "paymenthMethods" {
#   architectures                      = ["x86_64"]
#   code_signing_config_arn            = null
#   description                        = null
#   filename                           = null
#   function_name                      = "paymenthMethods"
#   handler                            = "lambda_function.lambda_handler"
#   image_uri                          = null
#   kms_key_arn                        = null
#   layers                             = []
#   memory_size                        = 128
#   package_type                       = "Zip"
#   publish                            = null
#   replace_security_groups_on_destroy = null
#   replacement_security_group_ids     = null
#   reserved_concurrent_executions     = -1
#   role                               = "arn:aws:iam::888577036740:role/service-role/JWTtoken_Website_Dev-role-ipskmhm7"
#   runtime                            = "python3.12"
#   s3_bucket                          = null
#   s3_key                             = null
#   s3_object_version                  = null
#   skip_destroy                       = false
#   source_code_hash                   = null
#   tags                               = {}
#   tags_all                           = {}
#   timeout                            = 15
#   ephemeral_storage {
#     size = 512
#   }
#   logging_config {
#     application_log_level = null
#     log_format            = "Text"
#     log_group             = "/aws/lambda/paymenthMethods"
#     system_log_level      = null
#   }
#   tracing_config {
#     mode = "PassThrough"
#   }
# }

# # __generated__ by Terraform
# resource "aws_lambda_function" "seatSealection" {
#   architectures                      = ["x86_64"]
#   code_signing_config_arn            = null
#   description                        = null
#   filename                           = null
#   function_name                      = "seatSealection"
#   handler                            = "lambda_function.lambda_handler"
#   image_uri                          = null
#   kms_key_arn                        = null
#   layers                             = []
#   memory_size                        = 128
#   package_type                       = "Zip"
#   publish                            = null
#   replace_security_groups_on_destroy = null
#   replacement_security_group_ids     = null
#   reserved_concurrent_executions     = -1
#   role                               = "arn:aws:iam::888577036740:role/service-role/seatSealection-role-hwgr84zk"
#   runtime                            = "python3.11"
#   s3_bucket                          = null
#   s3_key                             = null
#   s3_object_version                  = null
#   skip_destroy                       = false
#   source_code_hash                   = null
#   tags                               = {}
#   tags_all                           = {}
#   timeout                            = 63
#   ephemeral_storage {
#     size = 512
#   }
#   logging_config {
#     application_log_level = null
#     log_format            = "Text"
#     log_group             = "/aws/lambda/seatSealection"
#     system_log_level      = null
#   }
#   tracing_config {
#     mode = "PassThrough"
#   }
# }

# # __generated__ by Terraform
# resource "aws_lambda_function" "flightSelection_dev_Web" {
#   architectures                      = ["x86_64"]
#   code_signing_config_arn            = null
#   description                        = null
#   filename                           = null
#   function_name                      = "flightSelection_dev_Web"
#   handler                            = "lambda_function.lambda_handler"
#   image_uri                          = null
#   kms_key_arn                        = null
#   layers                             = []
#   memory_size                        = 128
#   package_type                       = "Zip"
#   publish                            = null
#   replace_security_groups_on_destroy = null
#   replacement_security_group_ids     = null
#   reserved_concurrent_executions     = -1
#   role                               = "arn:aws:iam::888577036740:role/service-role/JWTtoken_Website_Dev-role-ipskmhm7"
#   runtime                            = "python3.11"
#   s3_bucket                          = null
#   s3_key                             = null
#   s3_object_version                  = null
#   skip_destroy                       = false
#   source_code_hash                   = null
#   tags                               = {}
#   tags_all                           = {}
#   timeout                            = 3
#   ephemeral_storage {
#     size = 512
#   }
#   logging_config {
#     application_log_level = null
#     log_format            = "Text"
#     log_group             = "/aws/lambda/flightSelection_dev_Web"
#     system_log_level      = null
#   }
#   tracing_config {
#     mode = "PassThrough"
#   }
# }

# # __generated__ by Terraform
# resource "aws_lambda_function" "reservationPatmentTransaction" {
#   architectures                      = ["x86_64"]
#   code_signing_config_arn            = null
#   description                        = null
#   filename                           = null
#   function_name                      = "reservationPatmentTransaction"
#   handler                            = "lambda_function.lambda_handler"
#   image_uri                          = null
#   kms_key_arn                        = null
#   layers                             = []
#   memory_size                        = 128
#   package_type                       = "Zip"
#   publish                            = null
#   replace_security_groups_on_destroy = null
#   replacement_security_group_ids     = null
#   reserved_concurrent_executions     = -1
#   role                               = "arn:aws:iam::888577036740:role/service-role/JWTtoken_Website_Dev-role-ipskmhm7"
#   runtime                            = "python3.12"
#   s3_bucket                          = null
#   s3_key                             = null
#   s3_object_version                  = null
#   skip_destroy                       = false
#   source_code_hash                   = null
#   tags = {
#     Environment = "IHW-Dev"
#   }
#   tags_all = {
#     Environment = "IHW-Dev"
#   }
#   timeout = 123
#   ephemeral_storage {
#     size = 512
#   }
#   logging_config {
#     application_log_level = null
#     log_format            = "Text"
#     log_group             = "/aws/lambda/reservationPatmentTransaction"
#     system_log_level      = null
#   }
#   tracing_config {
#     mode = "PassThrough"
#   }
# }

# # __generated__ by Terraform
# resource "aws_lambda_function" "accessibilityRequest_Website_Dev" {
#   architectures                      = ["x86_64"]
#   code_signing_config_arn            = null
#   description                        = null
#   filename                           = null
#   function_name                      = "accessibilityRequest_Website_Dev"
#   handler                            = "lambda_function.lambda_handler"
#   image_uri                          = null
#   kms_key_arn                        = null
#   layers                             = []
#   memory_size                        = 128
#   package_type                       = "Zip"
#   publish                            = null
#   replace_security_groups_on_destroy = null
#   replacement_security_group_ids     = null
#   reserved_concurrent_executions     = -1
#   role                               = "arn:aws:iam::888577036740:role/service-role/JWTtoken_Website_Dev-role-ipskmhm7"
#   runtime                            = "python3.12"
#   s3_bucket                          = null
#   s3_key                             = null
#   s3_object_version                  = null
#   skip_destroy                       = false
#   source_code_hash                   = null
#   tags                               = {}
#   tags_all                           = {}
#   timeout                            = 10
#   ephemeral_storage {
#     size = 512
#   }
#   logging_config {
#     application_log_level = null
#     log_format            = "Text"
#     log_group             = "/aws/lambda/accessibilityRequest_Website_Dev"
#     system_log_level      = null
#   }
#   tracing_config {
#     mode = "PassThrough"
#   }
# }

# # __generated__ by Terraform
# resource "aws_lambda_function" "createReservation_Web_Dev" {
#   architectures                      = ["x86_64"]
#   code_signing_config_arn            = null
#   description                        = null
#   filename                           = null
#   function_name                      = "createReservation_Web_Dev"
#   handler                            = "lambda_function.lambda_handler"
#   image_uri                          = null
#   kms_key_arn                        = null
#   layers                             = []
#   memory_size                        = 128
#   package_type                       = "Zip"
#   publish                            = null
#   replace_security_groups_on_destroy = null
#   replacement_security_group_ids     = null
#   reserved_concurrent_executions     = -1
#   role                               = "arn:aws:iam::888577036740:role/service-role/JWTtoken_Website_Dev-role-ipskmhm7"
#   runtime                            = "python3.12"
#   s3_bucket                          = null
#   s3_key                             = null
#   s3_object_version                  = null
#   skip_destroy                       = false
#   source_code_hash                   = null
#   tags                               = {}
#   tags_all                           = {}
#   timeout                            = 300
#   ephemeral_storage {
#     size = 512
#   }
#   logging_config {
#     application_log_level = null
#     log_format            = "Text"
#     log_group             = "/aws/lambda/createReservation_Web_Dev"
#     system_log_level      = null
#   }
#   tracing_config {
#     mode = "PassThrough"
#   }
# }

# # __generated__ by Terraform
# resource "aws_lambda_function" "brb_purchaseService_dev_Web" {
#   architectures                      = ["x86_64"]
#   code_signing_config_arn            = null
#   description                        = null
#   filename                           = null
#   function_name                      = "brb_purchaseService_dev_Web"
#   handler                            = "lambda_function.lambda_handler"
#   image_uri                          = null
#   kms_key_arn                        = null
#   layers                             = []
#   memory_size                        = 128
#   package_type                       = "Zip"
#   publish                            = null
#   replace_security_groups_on_destroy = null
#   replacement_security_group_ids     = null
#   reserved_concurrent_executions     = -1
#   role                               = "arn:aws:iam::888577036740:role/service-role/JWTtoken_Website_Dev-role-ipskmhm7"
#   runtime                            = "python3.11"
#   s3_bucket                          = null
#   s3_key                             = null
#   s3_object_version                  = null
#   skip_destroy                       = false
#   source_code_hash                   = null
#   tags                               = {}
#   tags_all                           = {}
#   timeout                            = 3
#   ephemeral_storage {
#     size = 512
#   }
#   logging_config {
#     application_log_level = null
#     log_format            = "Text"
#     log_group             = "/aws/lambda/brb_purchaseService_dev_Web"
#     system_log_level      = null
#   }
#   tracing_config {
#     mode = "PassThrough"
#   }
# }

# # __generated__ by Terraform
# resource "aws_lambda_function" "test_calender" {
#   architectures                      = ["x86_64"]
#   code_signing_config_arn            = null
#   description                        = null
#   filename                           = null
#   function_name                      = "test_calender"
#   handler                            = "lambda_function.lambda_handler"
#   image_uri                          = null
#   kms_key_arn                        = null
#   layers                             = []
#   memory_size                        = 128
#   package_type                       = "Zip"
#   publish                            = null
#   replace_security_groups_on_destroy = null
#   replacement_security_group_ids     = null
#   reserved_concurrent_executions     = -1
#   role                               = "arn:aws:iam::888577036740:role/service-role/JWTtoken_Website_Dev-role-ipskmhm7"
#   runtime                            = "python3.10"
#   s3_bucket                          = null
#   s3_key                             = null
#   s3_object_version                  = null
#   skip_destroy                       = false
#   source_code_hash                   = null
#   tags                               = {}
#   tags_all                           = {}
#   timeout                            = 10
#   ephemeral_storage {
#     size = 512
#   }
#   logging_config {
#     application_log_level = null
#     log_format            = "Text"
#     log_group             = "/aws/lambda/test_calender"
#     system_log_level      = null
#   }
#   tracing_config {
#     mode = "PassThrough"
#   }
# }

# # __generated__ by Terraform
# resource "aws_lambda_function" "voucherCode_Web_Dev" {
#   architectures                      = ["x86_64"]
#   code_signing_config_arn            = null
#   description                        = null
#   filename                           = null
#   function_name                      = "voucherCode_Web_Dev"
#   handler                            = "lambda_function.lambda_handler"
#   image_uri                          = null
#   kms_key_arn                        = null
#   layers                             = []
#   memory_size                        = 128
#   package_type                       = "Zip"
#   publish                            = null
#   replace_security_groups_on_destroy = null
#   replacement_security_group_ids     = null
#   reserved_concurrent_executions     = -1
#   role                               = "arn:aws:iam::888577036740:role/service-role/JWTtoken_Website_Dev-role-ipskmhm7"
#   runtime                            = "python3.12"
#   s3_bucket                          = null
#   s3_key                             = null
#   s3_object_version                  = null
#   skip_destroy                       = false
#   source_code_hash                   = null
#   tags                               = {}
#   tags_all                           = {}
#   timeout                            = 15
#   ephemeral_storage {
#     size = 512
#   }
#   logging_config {
#     application_log_level = null
#     log_format            = "Text"
#     log_group             = "/aws/lambda/voucherCode_Web_Dev"
#     system_log_level      = null
#   }
#   tracing_config {
#     mode = "PassThrough"
#   }
# }

# # __generated__ by Terraform
# resource "aws_lambda_function" "Website_Dev_LamdaAuthoriser" {
#   architectures                      = ["x86_64"]
#   code_signing_config_arn            = null
#   description                        = null
#   filename                           = null
#   function_name                      = "Website_Dev_LamdaAuthoriser"
#   handler                            = "lambda_function.lambda_handler"
#   image_uri                          = null
#   kms_key_arn                        = null
#   layers                             = ["arn:aws:lambda:ca-central-1:888577036740:layer:PyJWT:1"]
#   memory_size                        = 128
#   package_type                       = "Zip"
#   publish                            = null
#   replace_security_groups_on_destroy = null
#   replacement_security_group_ids     = null
#   reserved_concurrent_executions     = -1
#   role                               = "arn:aws:iam::888577036740:role/service-role/JWTtoken_Website_Dev-role-ipskmhm7"
#   runtime                            = "python3.11"
#   s3_bucket                          = null
#   s3_key                             = null
#   s3_object_version                  = null
#   skip_destroy                       = false
#   source_code_hash                   = null
#   tags                               = {}
#   tags_all                           = {}
#   timeout                            = 10
#   ephemeral_storage {
#     size = 512
#   }
#   logging_config {
#     application_log_level = null
#     log_format            = "Text"
#     log_group             = "/aws/lambda/Website_Dev_LamdaAuthoriser"
#     system_log_level      = null
#   }
#   tracing_config {
#     mode = "PassThrough"
#   }
# }

# # __generated__ by Terraform
# resource "aws_lambda_function" "flightSearch_dev_Website" {
#   architectures                      = ["x86_64"]
#   code_signing_config_arn            = null
#   description                        = null
#   filename                           = null
#   function_name                      = "flightSearch_dev_Website"
#   handler                            = "lambda_function.lambda_handler"
#   image_uri                          = null
#   kms_key_arn                        = null
#   layers                             = []
#   memory_size                        = 128
#   package_type                       = "Zip"
#   publish                            = null
#   replace_security_groups_on_destroy = null
#   replacement_security_group_ids     = null
#   reserved_concurrent_executions     = -1
#   role                               = "arn:aws:iam::888577036740:role/service-role/JWTtoken_Website_Dev-role-ipskmhm7"
#   runtime                            = "python3.11"
#   s3_bucket                          = null
#   s3_key                             = null
#   s3_object_version                  = null
#   skip_destroy                       = false
#   source_code_hash                   = null
#   tags                               = {}
#   tags_all                           = {}
#   timeout                            = 20
#   ephemeral_storage {
#     size = 512
#   }
#   logging_config {
#     application_log_level = null
#     log_format            = "Text"
#     log_group             = "/aws/lambda/flightSearch_dev_Website"
#     system_log_level      = null
#   }
#   tracing_config {
#     mode = "PassThrough"
#   }
# }

# # __generated__ by Terraform
# resource "aws_lambda_function" "flair-hopper-api" {
#   architectures                      = ["x86_64"]
#   code_signing_config_arn            = null
#   description                        = null
#   filename                           = null
#   function_name                      = "flair-hopper-api"
#   handler                            = "lambda_function.lambda_handler"
#   image_uri                          = null
#   kms_key_arn                        = null
#   layers                             = []
#   memory_size                        = 128
#   package_type                       = "Zip"
#   publish                            = null
#   replace_security_groups_on_destroy = null
#   replacement_security_group_ids     = null
#   reserved_concurrent_executions     = -1
#   role                               = "arn:aws:iam::888577036740:role/service-role/flair-hopper-api-role-m645of6u"
#   runtime                            = "python3.13"
#   s3_bucket                          = null
#   s3_key                             = null
#   s3_object_version                  = null
#   skip_destroy                       = false
#   source_code_hash                   = null
#   tags                               = {}
#   tags_all                           = {}
#   timeout                            = 3
#   ephemeral_storage {
#     size = 512
#   }
#   logging_config {
#     application_log_level = null
#     log_format            = "Text"
#     log_group             = "/aws/lambda/flair-hopper-api"
#     system_log_level      = null
#   }
#   tracing_config {
#     mode = "PassThrough"
#   }
# }
# resource "aws_lambda_function" "paymenthMethods" {}
