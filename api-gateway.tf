# Create an API Gateway REST API
resource "aws_api_gateway_rest_api" "website_dev" {
  name        = "Website-Dev"
  description = "API Gateway for Website Dev"
}

# Create API Gateway resources
resource "aws_api_gateway_resource" "accessibility_request" {
  rest_api_id = aws_api_gateway_rest_api.website_dev.id
  parent_id   = aws_api_gateway_rest_api.website_dev.root_resource_id
  path_part   = "accessibilityRequest"
}

resource "aws_api_gateway_resource" "ancillary_search" {
  rest_api_id = aws_api_gateway_rest_api.website_dev.id
  parent_id   = aws_api_gateway_rest_api.website_dev.root_resource_id
  path_part   = "searchAncillary"
}

resource "aws_api_gateway_resource" "create_reservation" {
  rest_api_id = aws_api_gateway_rest_api.website_dev.id
  parent_id   = aws_api_gateway_rest_api.website_dev.root_resource_id
  path_part   = "createReservation"
}

resource "aws_api_gateway_resource" "flight_selection" {
  rest_api_id = aws_api_gateway_rest_api.website_dev.id
  parent_id   = aws_api_gateway_rest_api.website_dev.root_resource_id
  path_part   = "flightSelect"
}

resource "aws_api_gateway_resource" "low_fares" {
  rest_api_id = aws_api_gateway_rest_api.website_dev.id
  parent_id   = aws_api_gateway_rest_api.website_dev.root_resource_id
  path_part   = "lowFares"
}

resource "aws_api_gateway_resource" "payment_methods" {
  rest_api_id = aws_api_gateway_rest_api.website_dev.id
  parent_id   = aws_api_gateway_rest_api.website_dev.root_resource_id
  path_part   = "paymentMethods"
}

resource "aws_api_gateway_resource" "payment_reservation" {
  rest_api_id = aws_api_gateway_rest_api.website_dev.id
  parent_id   = aws_api_gateway_rest_api.website_dev.root_resource_id
  path_part   = "paymentReservation"
}

resource "aws_api_gateway_resource" "seat_selection" {
  rest_api_id = aws_api_gateway_rest_api.website_dev.id
  parent_id   = aws_api_gateway_rest_api.website_dev.root_resource_id
  path_part   = "seatSelection"
}

resource "aws_api_gateway_resource" "voucher_code" {
  rest_api_id = aws_api_gateway_rest_api.website_dev.id
  parent_id   = aws_api_gateway_rest_api.website_dev.root_resource_id
  path_part   = "voucherCode"
}

# Create API Gateway methods
resource "aws_api_gateway_method" "accessibility_request_get" {
  rest_api_id = aws_api_gateway_rest_api.website_dev.id
  resource_id = aws_api_gateway_resource.accessibility_request.id
  http_method = "GET"
  authorization = "CUSTOM"
}

resource "aws_api_gateway_method" "ancillary_search_get" {
  rest_api_id = aws_api_gateway_rest_api.website_dev.id
  resource_id = aws_api_gateway_resource.ancillary_search.id
  http_method = "GET"
  authorization = "CUSTOM"
}

resource "aws_api_gateway_method" "create_reservation_post" {
  rest_api_id = aws_api_gateway_rest_api.website_dev.id
  resource_id = aws_api_gateway_resource.create_reservation.id
  http_method = "POST"
  authorization = "CUSTOM"
}

resource "aws_api_gateway_method" "flight_selection_get" {
  rest_api_id = aws_api_gateway_rest_api.website_dev.id
  resource_id = aws_api_gateway_resource.flight_selection.id
  http_method = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_method" "low_fares_get" {
  rest_api_id = aws_api_gateway_rest_api.website_dev.id
  resource_id = aws_api_gateway_resource.low_fares.id
  http_method = "GET"
  authorization = "CUSTOM"
}

resource "aws_api_gateway_method" "payment_methods_get" {
  rest_api_id = aws_api_gateway_rest_api.website_dev.id
  resource_id = aws_api_gateway_resource.payment_methods.id
  http_method = "GET"
  authorization = "CUSTOM"
}

resource "aws_api_gateway_method" "payment_reservation_post" {
  rest_api_id = aws_api_gateway_rest_api.website_dev.id
  resource_id = aws_api_gateway_resource.payment_reservation.id
  http_method = "POST"
  authorization = "CUSTOM"
}

resource "aws_api_gateway_method" "seat_selection_get" {
  rest_api_id = aws_api_gateway_rest_api.website_dev.id
  resource_id = aws_api_gateway_resource.seat_selection.id
  http_method = "GET"
  authorization = "CUSTOM"
}

resource "aws_api_gateway_method" "voucher_code_get" {
  rest_api_id = aws_api_gateway_rest_api.website_dev.id
  resource_id = aws_api_gateway_resource.voucher_code.id
  http_method = "GET"
  authorization = "CUSTOM"
}

# Create API Gateway integrations
resource "aws_api_gateway_integration" "accessibility_request_get" {
  rest_api_id = aws_api_gateway_rest_api.website_dev.id
  resource_id = aws_api_gateway_resource.accessibility_request.id
  http_method = aws_api_gateway_method.accessibility_request_get.http_method
  integration_http_method = "GET"
  type        = "LAMBDA"
  uri         = aws_lambda_function.accessibilityRequest_Website_Dev.arn
}

resource "aws_api_gateway_integration" "ancillary_search_get" {
  rest_api_id = aws_api_gateway_rest_api.website_dev.id
  resource_id = aws_api_gateway_resource.ancillary_search.id
  http_method = aws_api_gateway_method.ancillary_search_get.http_method
  integration_http_method = "GET"
  type        = "LAMBDA"
  uri         = aws_lambda_function.ancillarySearch.arn
}

resource "aws_api_gateway_integration" "create_reservation_post" {
  rest_api_id = aws_api_gateway_rest_api.website_dev.id
  resource_id = aws_api_gateway_resource.create_reservation.id
  http_method = aws_api_gateway_method.create_reservation_post.http_method
  integration_http_method = "POST"
  type        = "LAMBDA"
  uri         = aws_lambda_function.createReservation_Web_Dev.arn
}

resource "aws_api_gateway_integration" "flight_selection_get" {
  rest_api_id = aws_api_gateway_rest_api.website_dev.id
  resource_id = aws_api_gateway_resource.flight_selection.id
  http_method = aws_api_gateway_method.flight_selection_get.http_method
  integration_http_method = "GET"
  type        = "LAMBDA"
  uri         = aws_api_gateway_method.flight_selection_get.arn
}

resource "aws_api_gateway_integration" "low_fares_get" {
  rest_api_id = aws_api_gateway_rest_api.website_dev.id
  resource_id = aws_api_gateway_resource.low_fares.id
  http_method = aws_api_gateway_method.low_fares_get.http_method
  integration_http_method = "GET"
  type        = "LAMBDA"
  uri         = aws_lambda_function.accessibilityRequest_Website_Dev.arn
}

resource "aws_api_gateway_integration" "payment_methods_get" {
  rest_api_id = aws_api_gateway_rest_api.website_dev.id
  resource_id = aws_api_gateway_resource.payment_methods.id
  http_method = aws_api_gateway_method.payment_methods_get.http_method
  integration_http_method = "GET"
  type        = "LAMBDA"
  uri         = aws_lambda_function
}

resource "aws_api_gateway_integration" "payment_reservation_post" {
  rest_api_id = aws_api_gateway_rest_api.website_dev.id
  resource_id = aws_api_gateway_resource.payment_reservation.id
  http_method = aws_api_gateway_method.payment_reservation_post.http_method
  integration_http_method = "POST"
  type        = "LAMBDA"
  uri         = aws_lambda_function.reservationPaymentTransaction_dev_IHW.arn
}

resource "aws_api_gateway_integration" "seat_selection_get" {
  rest_api_id = aws_api_gateway_rest_api.website_dev.id
  resource_id = aws_api_gateway_resource.seat_selection.id
  http_method = aws_api_gateway_method.seat_selection_get.http_method
  integration_http_method = "GET"
  type        = "LAMBDA"
  uri         = aws_lambda_function.seatSealection.arn
}

resource "aws_api_gateway_integration" "voucher_code_get" {
  rest_api_id = aws_api_gateway_rest_api.website_dev.id
  resource_id = aws_api_gateway_resource.voucher_code.id
  http_method = aws_api_gateway_method.voucher_code_get.http_method
  integration_http_method = "GET"
  type        = "LAMBDA"
  uri         = aws_lambda_function.voucherCode_Web_Dev
}

# # Deploy the API Gateway
# resource "aws_api_gateway_deployment" "website_dev" {
#   depends_on = [aws_api_gateway_integration.accessibility_request_get]
#   rest_api_id = aws_api_gateway_rest_api.website_dev.id
#   stage_name  = "dev"
# }

