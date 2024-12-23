resource "aws_lambda_function" "paymenthMethods" {
  filename                           = "./lambda_function_files/paymenthMethods.zip"
  source_code_hash                   = filebase64sha256("./lambda_function_files/paymenthMethods.zip")
  function_name                      = "paymenthMethods"
  handler                            = "lambda_function.lambda_handler"
  role                               = "arn:aws:iam::888577036740:role/service-role/JWTtoken_Website_Dev-role-ipskmhm7"
  runtime                            = "python3.12"
  timeout                            = 15
  ephemeral_storage {
    size = 512
  }
  logging_config {
    log_format            = "Text"
    log_group             = "/aws/lambda/paymenthMethods"
  }
  tracing_config {
    mode = "PassThrough"
  }
  layers = [
     "arn:aws:lambda:${data.aws_caller_identity.current.account_id}:layer:paymenthMethods:v1" 
    ]
}

resource "aws_lambda_function" "reservationPaymentTransaction_dev_IHW" {
  filename                           = "./lambda_function_files/reservationPaymentTransaction_dev_IHW.zip"
  source_code_hash                   = filebase64sha256("./lambda_function_files/reservationPaymentTransaction_dev_IHW.zip")
  function_name                      = "reservationPaymentTransaction_dev_IHW"
  handler                            = "lambda_function.lambda_handler"
  role                               = "arn:aws:iam::888577036740:role/service-role/JWTtoken_Website_Dev-role-ipskmhm7"
  runtime                            = "python3.12"
  tags = {
    Lamda = "IHW-dev"
  }
  tags_all = {
    Lamda = "IHW-dev"
  }
  timeout = 150
  ephemeral_storage {
    size = 512
  }
  logging_config {
    log_format            = "Text"
    log_group             = "/aws/lambda/reservationPaymentTransaction_dev_IHW"
  }
  tracing_config {
    mode = "PassThrough"
  }
    # layers = [
    #  "arn:aws:lambda:${data.aws_caller_identity.current.account_id}:layer:reservationPaymentTransaction_dev_IHW:v1" 
    # ]
}

resource "aws_lambda_function" "ancillarySearch" {
  filename                           = "./lambda_function_files/ancillarySearch.zip"
  source_code_hash                   = filebase64sha256("./lambda_function_files/ancillarySearch.zip")
  function_name                      = "ancillarySearch"
  handler                            = "lambda_function.lambda_handler"
  role                               = "arn:aws:iam::888577036740:role/service-role/JWTtoken_Website_Dev-role-ipskmhm7"
  runtime                            = "python3.11"
  timeout                            = 80
  ephemeral_storage {
    size = 512
  }
  logging_config {
    log_format            = "Text"
    log_group             = "/aws/lambda/ancillarySearch"
  }
  tracing_config {
    mode = "PassThrough"
  }
  # layers = [
  #    "arn:aws:lambda:${data.aws_caller_identity.current.account_id}:layer:<layer_name>:<version>" 
  #   ]
}

resource "aws_lambda_function" "addancillary-hoper-dev-web" {
  filename                           = "./lambda_function_files/addancillary-hoper-dev-web.zip"
  source_code_hash                   = filebase64sha256("./lambda_function_files/addancillary-hoper-dev-web.zip")
  function_name                      = "addancillary-hoper-dev-web"
  handler                            = "lambda_function.lambda_handler"
  role                               = "arn:aws:iam::888577036740:role/service-role/JWTtoken_Website_Dev-role-ipskmhm7"
  runtime                            = "python3.12"
  timeout                            = 90
  ephemeral_storage {
    size = 512
  }
  logging_config {
    log_format            = "Text"
    log_group             = "/aws/lambda/addancillary-hoper-dev-web"
  }
  tracing_config {
    mode = "PassThrough"
  }
  # layers = [
  #    "arn:aws:lambda:${data.aws_caller_identity.current.account_id}:layer:<layer_name>:<version>" 
  #   ]
}

resource "aws_lambda_function" "voucherCode" {
  filename                           = "./lambda_function_files/voucherCode.zip"
  source_code_hash                   = filebase64sha256("./lambda_function_files/voucherCode.zip")
  function_name                      = "voucherCode"
  handler                            = "lambda_function.lambda_handler"
  role                               = "arn:aws:iam::888577036740:role/service-role/JWTtoken_Website_Dev-role-ipskmhm7"
  runtime                            = "python3.12"
  timeout                            = 3
  environment {
    variables = {
      API_URL     = "https://flairair-api.intelisystraining.ca/RESTv1/vouchers/Generate?{fields}  "
      PASSWORD    = "APIGATE"
      USERNAME    = "Flair123$"
      VOUCHER_KEY = "aƒJj2ImKybdP8tQcem2rUqODpzveNdvDKwoL3l¥DYg8="
    }
  }
  ephemeral_storage {
    size = 512
  }
  logging_config {
    log_format            = "Text"
    log_group             = "/aws/lambda/voucherCode"
  }
  tracing_config {
    mode = "PassThrough"
  }
  # layers = [
  #    "arn:aws:lambda:${data.aws_caller_identity.current.account_id}:layer:<layer_name>:<version>" 
  #   ]
}

resource "aws_lambda_function" "klaviyo_event_dev" {
  filename                           = "./lambda_function_files/klaviyo_event_dev.zip"
  source_code_hash                   = filebase64sha256("./lambda_function_files/klaviyo_event_dev.zip")
  function_name                      = "klaviyo_event_dev"
  handler                            = "lambda_function.lambda_handler"
  role                               = "arn:aws:iam::888577036740:role/service-role/JWTtoken_Website_Dev-role-ipskmhm7"
  runtime                            = "python3.12"
  timeout                            = 50
  ephemeral_storage {
    size = 512
  }
  logging_config {
    log_format            = "Text"
    log_group             = "/aws/lambda/klaviyo_event_dev"
  }
  tracing_config {
    mode = "PassThrough"
  }
  # layers = [
  #    "arn:aws:lambda:${data.aws_caller_identity.current.account_id}:layer:<layer_name>:<version>" 
  #   ]
}

resource "aws_lambda_function" "flightSearch_dev_Website" {
  filename                           = "./lambda_function_files/flightSearch_dev_Website.zip"
  source_code_hash                   = filebase64sha256("./lambda_function_files/flightSearch_dev_Website.zip")
  function_name                      = "flightSearch_dev_Website"
  handler                            = "lambda_function.lambda_handler"
  role                               = "arn:aws:iam::888577036740:role/service-role/JWTtoken_Website_Dev-role-ipskmhm7"
  runtime                            = "python3.11"
  timeout                            = 20
  ephemeral_storage {
    size = 512
  }
  logging_config {
    log_format            = "Text"
    log_group             = "/aws/lambda/flightSearch_dev_Website"
  }
  tracing_config {
    mode = "PassThrough"
  }
  # layers = [
  #    "arn:aws:lambda:${data.aws_caller_identity.current.account_id}:layer:<layer_name>:<version>" 
  #   ]
}

resource "aws_lambda_function" "accessibilityRequest_Website_Dev" {
  filename                           = "./lambda_function_files/accessibilityRequest_Website_Dev.zip"
  source_code_hash                   = filebase64sha256("./lambda_function_files/accessibilityRequest_Website_Dev.zip")
  function_name                      = "accessibilityRequest_Website_Dev"
  handler                            = "lambda_function.lambda_handler"
  role                               = "arn:aws:iam::888577036740:role/service-role/JWTtoken_Website_Dev-role-ipskmhm7"
  runtime                            = "python3.12"
  timeout                            = 10
  ephemeral_storage {
    size = 512
  }
  logging_config {
    log_format            = "Text"
    log_group             = "/aws/lambda/accessibilityRequest_Website_Dev"
  }
  tracing_config {
    mode = "PassThrough"
  }
  # layers = [
  #    "arn:aws:lambda:${data.aws_caller_identity.current.account_id}:layer:<layer_name>:<version>" 
  #   ]
}

resource "aws_lambda_function" "baggage" {
  filename                           = "./lambda_function_files/baggage.zip"
  source_code_hash                   = filebase64sha256("./lambda_function_files/baggage.zip")
  function_name                      = "baggage"
  handler                            = "lambda_function.lambda_handler"
  role                               = "arn:aws:iam::888577036740:role/service-role/baggage-role-vhect9mj"
  runtime                            = "python3.11"
  timeout                            = 63
  ephemeral_storage {
    size = 512
  }
  logging_config {
    log_format            = "Text"
    log_group             = "/aws/lambda/baggage"
  }
  tracing_config {
    mode = "PassThrough"
  }
  # layers = [
  #    "arn:aws:lambda:${data.aws_caller_identity.current.account_id}:layer:<layer_name>:<version>" 
  #   ]
}

resource "aws_lambda_function" "voucherCode_Web_Dev" {
  filename                           = "./lambda_function_files/voucherCode_Web_Dev.zip"
  source_code_hash                   = filebase64sha256("./lambda_function_files/voucherCode_Web_Dev.zip")
  function_name                      = "voucherCode_Web_Dev"
  handler                            = "lambda_function.lambda_handler"
  role                               = "arn:aws:iam::888577036740:role/service-role/JWTtoken_Website_Dev-role-ipskmhm7"
  runtime                            = "python3.12"
  timeout                            = 15
  ephemeral_storage {
    size = 512
  }
  logging_config {
    log_format            = "Text"
    log_group             = "/aws/lambda/voucherCode_Web_Dev"
  }
  tracing_config {
    mode = "PassThrough"
  }
  # layers = [
  #    "arn:aws:lambda:${data.aws_caller_identity.current.account_id}:layer:<layer_name>:<version>" 
  #   ]
}

resource "aws_lambda_function" "reservationPatmentTransaction" {
  filename                           = "./lambda_function_files/reservationPatmentTransaction.zip"
  source_code_hash                   = filebase64sha256("./lambda_function_files/reservationPatmentTransaction.zip")
  function_name                      = "reservationPatmentTransaction"
  handler                            = "lambda_function.lambda_handler"
  role                               = "arn:aws:iam::888577036740:role/service-role/JWTtoken_Website_Dev-role-ipskmhm7"
  runtime                            = "python3.12"
  tags = {
    Environment = "IHW-Dev"
  }
  tags_all = {
    Environment = "IHW-Dev"
  }
  timeout = 123
  ephemeral_storage {
    size = 512
  }
  logging_config {
    log_format            = "Text"
    log_group             = "/aws/lambda/reservationPatmentTransaction"
  }
  tracing_config {
    mode = "PassThrough"
  }
  # layers = [
  #    "arn:aws:lambda:${data.aws_caller_identity.current.account_id}:layer:<layer_name>:<version>" 
  #   ]
}

resource "aws_lambda_function" "seatSealection" {
  filename                           = "./lambda_function_files/seatSealection.zip"
  source_code_hash                   = filebase64sha256("./lambda_function_files/seatSealection.zip")
  function_name                      = "seatSealection"
  handler                            = "lambda_function.lambda_handler"
  role                               = "arn:aws:iam::888577036740:role/service-role/seatSealection-role-hwgr84zk"
  runtime                            = "python3.11"
  timeout                            = 63
  ephemeral_storage {
    size = 512
  }
  logging_config {
    log_format            = "Text"
    log_group             = "/aws/lambda/seatSealection"
  }
  tracing_config {
    mode = "PassThrough"
  }
  # layers = [
  #    "arn:aws:lambda:${data.aws_caller_identity.current.account_id}:layer:<layer_name>:<version>" 
  #   ]
}

resource "aws_lambda_function" "Website_Dev_LamdaAuthoriser" {
  filename                           = "./lambda_function_files/Website_Dev_LamdaAuthoriser.zip"
  source_code_hash                   = filebase64sha256("./lambda_function_files/Website_Dev_LamdaAuthoriser.zip")
  function_name                      = "Website_Dev_LamdaAuthoriser"
  handler                            = "lambda_function.lambda_handler"
  role                               = "arn:aws:iam::888577036740:role/service-role/JWTtoken_Website_Dev-role-ipskmhm7"
  runtime                            = "python3.11"
  timeout                            = 10
  ephemeral_storage {
    size = 512
  }
  logging_config {
    log_format            = "Text"
    log_group             = "/aws/lambda/Website_Dev_LamdaAuthoriser"
  }
  tracing_config {
    mode = "PassThrough"
  }
  # layers = [
  #    "arn:aws:lambda:${data.aws_caller_identity.current.account_id}:layer:<layer_name>:<version>" 
  #   ]
}

resource "aws_lambda_function" "flightSelection_dev_Web" {
  filename                           = "./lambda_function_files/flightSelection_dev_Web.zip"
  source_code_hash                   = filebase64sha256("./lambda_function_files/flightSelection_dev_Web.zip")
  function_name                      = "flightSelection_dev_Web"
  handler                            = "lambda_function.lambda_handler"
  role                               = "arn:aws:iam::888577036740:role/service-role/JWTtoken_Website_Dev-role-ipskmhm7"
  runtime                            = "python3.11"
  timeout                            = 3
  ephemeral_storage {
    size = 512
  }
  logging_config {
    log_format            = "Text"
    log_group             = "/aws/lambda/flightSelection_dev_Web"
  }
  tracing_config {
    mode = "PassThrough"
  }
  # layers = [
  #    "arn:aws:lambda:${data.aws_caller_identity.current.account_id}:layer:<layer_name>:<version>" 
  #   ]
}

resource "aws_lambda_function" "lambdaFunction-dev" {
  filename                           = "./lambda_function_files/lambdaFunction-dev.zip"
  source_code_hash                   = filebase64sha256("./lambda_function_files/lambdaFunction-dev.zip")
  function_name                      = "lambdaFunction-dev"
  handler                            = "validate.handler"
  role                               = "arn:aws:iam::888577036740:role/lambdaFunction-dev"
  runtime                            = "python3.9"
  tags = {
    Environment        = "Development"
    createdbyTerraform = "true"
  }
  tags_all = {
    Environment        = "Development"
    createdbyTerraform = "true"
  }
  timeout = 120
  ephemeral_storage {
    size = 512
  }
  logging_config {
    log_format            = "Text"
    log_group             = "/aws/lambda/lambdaFunction-dev"
  }
  tracing_config {
    mode = "Active"
  }
  # layers = [
  #    "arn:aws:lambda:${data.aws_caller_identity.current.account_id}:layer:<layer_name>:<version>" 
  #   ]
}

resource "aws_lambda_function" "flightSearch" {
  filename                           = "./lambda_function_files/flightSearch.zip"
  source_code_hash                   = filebase64sha256("./lambda_function_files/flightSearch.zip")
  function_name                      = "flightSearch"
  handler                            = "lambda_function.lambda_handler"
  role                               = "arn:aws:iam::888577036740:role/service-role/JWTtoken_Website_Dev-role-ipskmhm7"
  runtime                            = "python3.11"
  timeout                            = 8
  ephemeral_storage {
    size = 512
  }
  logging_config {
    log_format            = "Text"
    log_group             = "/aws/lambda/flightSearch"
  }
  tracing_config {
    mode = "PassThrough"
  }
  # layers = [
  #    "arn:aws:lambda:${data.aws_caller_identity.current.account_id}:layer:<layer_name>:<version>" 
  #   ]
}

resource "aws_lambda_function" "createReservation_Web_Dev" {
  filename                           = "./lambda_function_files/createReservation_Web_Dev.zip"
  source_code_hash                   = filebase64sha256("./lambda_function_files/createReservation_Web_Dev.zip")
  function_name                      = "createReservation_Web_Dev"
  handler                            = "lambda_function.lambda_handler"
  role                               = "arn:aws:iam::888577036740:role/service-role/JWTtoken_Website_Dev-role-ipskmhm7"
  runtime                            = "python3.12"
  timeout                            = 300
  ephemeral_storage {
    size = 512
  }
  logging_config {
    log_format            = "Text"
    log_group             = "/aws/lambda/createReservation_Web_Dev"
  }
  tracing_config {
    mode = "PassThrough"
  }
  # layers = [
  #    "arn:aws:lambda:${data.aws_caller_identity.current.account_id}:layer:<layer_name>:<version>" 
  #   ]
}

resource "aws_lambda_function" "test_calender" {
  filename                           = "./lambda_function_files/test_calender.zip"
  source_code_hash                   = filebase64sha256("./lambda_function_files/test_calender.zip")
  function_name                      = "test_calender"
  handler                            = "lambda_function.lambda_handler"
  role                               = "arn:aws:iam::888577036740:role/service-role/JWTtoken_Website_Dev-role-ipskmhm7"
  runtime                            = "python3.10"
  timeout                            = 10
  ephemeral_storage {
    size = 512
  }
  logging_config {
    log_format            = "Text"
    log_group             = "/aws/lambda/test_calender"
  }
  tracing_config {
    mode = "PassThrough"
  }
  # layers = [
  #    "arn:aws:lambda:${data.aws_caller_identity.current.account_id}:layer:<layer_name>:<version>" 
  #   ]
}

resource "aws_lambda_function" "brb_purchaseService_dev_Web" {
  filename                           = "./lambda_function_files/brb_purchaseService_dev_Web.zip"
  source_code_hash                   = filebase64sha256("./lambda_function_files/brb_purchaseService_dev_Web.zip")
  function_name                      = "brb_purchaseService_dev_Web"
  handler                            = "lambda_function.lambda_handler"
  role                               = "arn:aws:iam::888577036740:role/service-role/JWTtoken_Website_Dev-role-ipskmhm7"
  runtime                            = "python3.11"
  timeout                            = 3
  ephemeral_storage {
    size = 512
  }
  logging_config {
    log_format            = "Text"
    log_group             = "/aws/lambda/brb_purchaseService_dev_Web"
  }
  tracing_config {
    mode = "PassThrough"
  }
  # layers = [
  #    "arn:aws:lambda:${data.aws_caller_identity.current.account_id}:layer:<layer_name>:<version>" 
  #   ]
}

resource "aws_lambda_function" "Website_Dev_CalenderRates" {
  filename                           = "./lambda_function_files/Website_Dev_CalenderRates.zip"
  source_code_hash                   = filebase64sha256("./lambda_function_files/Website_Dev_CalenderRates.zip")
  function_name                      = "Website_Dev_CalenderRates"
  handler                            = "lambda_function.lambda_handler"
  role                               = "arn:aws:iam::888577036740:role/service-role/JWTtoken_Website_Dev-role-ipskmhm7"
  runtime                            = "python3.11"
  timeout                            = 15
  ephemeral_storage {
    size = 512
  }
  logging_config {
    log_format            = "Text"
    log_group             = "/aws/lambda/Website_Dev_CalenderRates"
  }
  tracing_config {
    mode = "PassThrough"
  }
  # layers = [
  #    "arn:aws:lambda:${data.aws_caller_identity.current.account_id}:layer:<layer_name>:<version>" 
  #   ]
}

resource "aws_lambda_function" "flair-hopper-api" {
  filename                           = "./lambda_function_files/flair-hopper-api.zip"
  source_code_hash                   = filebase64sha256("./lambda_function_files/flair-hopper-api.zip")
  function_name                      = "flair-hopper-api"
  handler                            = "lambda_function.lambda_handler"
  role                               = "arn:aws:iam::888577036740:role/service-role/flair-hopper-api-role-m645of6u"
  runtime                            = "Python 3.13"
  timeout                            = 3
  ephemeral_storage {
    size = 512
  }
  logging_config {
    log_format            = "Text"
    log_group             = "/aws/lambda/flair-hopper-api"
  }
  tracing_config {
    mode = "PassThrough"
  }
  # layers = [
  #    "arn:aws:lambda:${data.aws_caller_identity.current.account_id}:layer:<layer_name>:<version>" 
  #   ]
}

resource "aws_lambda_function" "lowFareoptions_Dev_Website" {
  filename                           = "./lambda_function_files/lowFareoptions_Dev_Website.zip"
  source_code_hash                   = filebase64sha256("./lambda_function_files/lowFareoptions_Dev_Website.zip")
  function_name                      = "lowFareoptions_Dev_Website"
  handler                            = "lambda_function.lambda_handler"
  role                               = "arn:aws:iam::888577036740:role/service-role/JWTtoken_Website_Dev-role-ipskmhm7"
  runtime                            = "python3.11"
  timeout                            = 3
  ephemeral_storage {
    size = 512
  }
  logging_config {
    log_format            = "Text"
    log_group             = "/aws/lambda/lowFareoptions_Dev_Website"
  }
  tracing_config {
    mode = "PassThrough"
  }
  # layers = [
  #    "arn:aws:lambda:${data.aws_caller_identity.current.account_id}:layer:<layer_name>:<version>" 
  #   ]
}

resource "aws_lambda_function" "JWTtoken_Website_Dev" {
  filename                           = "./lambda_function_files/JWTtoken_Website_Dev.zip"
  source_code_hash                   = filebase64sha256("./lambda_function_files/JWTtoken_Website_Dev.zip")
  function_name                      = "JWTtoken_Website_Dev"
  handler                            = "lambda_function.lambda_handler"
  role                               = "arn:aws:iam::888577036740:role/service-role/JWTtoken_Website_Dev-role-ipskmhm7"
  runtime                            = "python3.12"
  timeout                            = 10
  ephemeral_storage {
    size = 512
  }
  logging_config {
    log_format            = "Text"
    log_group             = "/aws/lambda/JWTtoken_Website_Dev"
  }
  tracing_config {
    mode = "PassThrough"
  }
  # layers = [
  #    "arn:aws:lambda:${data.aws_caller_identity.current.account_id}:layer:<layer_name>:<version>" 
  #   ]
}
