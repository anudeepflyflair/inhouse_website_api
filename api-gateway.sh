#!/bin/bash

# List of your API Gateway IDs and their human-readable names
declare -A API_GATEWAYS=(
  ["api-id-1"]="accessibilityRequest"
  ["api-id-2"]="ancillarySearch"
  ["api-id-3"]="createReservation"
  ["api-id-4"]="flightSelection"
  ["api-id-5"]="lowFareoptions"
  ["api-id-6"]="paymentMethods"
  ["api-id-7"]="reservationPaymentTransaction"
  ["api-id-8"]="seatSelection"
  ["api-id-9"]="voucherCode"
)

# Example stage name (this should be the same for all gateways if you're using the same stage)
STAGE_NAME="dev"

# Loop over each API Gateway ID and human-readable name
for API_ID in "${!API_GATEWAYS[@]}"; do
  HUMAN_READABLE_NAME="${API_GATEWAYS[$API_ID]}"
  echo "Processing API Gateway: $HUMAN_READABLE_NAME (ID: $API_ID)"

  # Check if the API Gateway Rest API resource block exists in api-gateway.tf, if not create it
  if ! grep -q "aws_api_gateway_rest_api.api_$HUMAN_READABLE_NAME" api-gateway.tf; then
    echo "Creating Terraform block for aws_api_gateway_rest_api.api_$HUMAN_READABLE_NAME"
    echo "
resource \"aws_api_gateway_rest_api\" \"api_$HUMAN_READABLE_NAME\" {
  name        = \"$HUMAN_READABLE_NAME\"
  description = \"Imported API Gateway $HUMAN_READABLE_NAME\"
}" >> api-gateway.tf
  fi

  # Import the API Gateway (Rest API)
  echo "Importing API Gateway: $HUMAN_READABLE_NAME"
  terraform import aws_api_gateway_rest_api.api_$HUMAN_READABLE_NAME $API_ID

  # Fetch all resources for the given API
  resources=$(aws apigateway get-resources --rest-api-id $API_ID --query 'items[*].id' --output text)

  # Iterate through each resource and import the resource and its methods
  for resource_id in $resources; do
    # Fetch the resource path (for better naming in Terraform)
    resource_path=$(aws apigateway get-resource --rest-api-id $API_ID --resource-id $resource_id --query 'path' --output text)

    # Check if the resource block exists in api-gateway.tf, if not create it
    if ! grep -q "aws_api_gateway_resource.${HUMAN_READABLE_NAME}_${resource_path//\//_}" api-gateway.tf; then
      echo "Creating Terraform block for aws_api_gateway_resource.${HUMAN_READABLE_NAME}_${resource_path//\//_}"
      echo "
resource \"aws_api_gateway_resource\" \"${HUMAN_READABLE_NAME}_${resource_path//\//_}\" {
  rest_api_id = aws_api_gateway_rest_api.api_$HUMAN_READABLE_NAME.id
  parent_id   = aws_api_gateway_rest_api.api_$HUMAN_READABLE_NAME.root_resource_id
  path_part   = \"$resource_path\"
}" >> api-gateway.tf
    fi

    # Import the resource into Terraform
    echo "Importing resource: $resource_path (ID: $resource_id)"
    terraform import aws_api_gateway_resource.${HUMAN_READABLE_NAME}_${resource_path//\//_} $API_ID/$resource_id

    # Fetch methods for the resource (GET, POST, etc.)
    methods=$(aws apigateway get-methods --rest-api-id $API_ID --resource-id $resource_id --query 'items[*].httpMethod' --output text)

    # Iterate through each method and import it
    for method in $methods; do
      # Check if the method block exists in api-gateway.tf, if not create it
      if ! grep -q "aws_api_gateway_method.${HUMAN_READABLE_NAME}_${resource_path//\//_}_${method}" api-gateway.tf; then
        echo "Creating Terraform block for aws_api_gateway_method.${HUMAN_READABLE_NAME}_${resource_path//\//_}_${method}"
        echo "
resource \"aws_api_gateway_method\" \"${HUMAN_READABLE_NAME}_${resource_path//\//_}_${method}\" {
  rest_api_id   = aws_api_gateway_rest_api.api_$HUMAN_READABLE_NAME.id
  resource_id   = aws_api_gateway_resource.${HUMAN_READABLE_NAME}_${resource_path//\//_}.id
  http_method   = \"$method\"
  authorization = \"NONE\"  # Update this if using custom authorization (e.g., Lambda authorizer)
}" >> api-gateway.tf
      fi

      # Import the method into Terraform
      echo "Importing method: $method for resource $resource_path"
      terraform import aws_api_gateway_method.${HUMAN_READABLE_NAME}_${resource_path//\//_}_${method} $API_ID/$resource_id/$method

      # Fetch integration details for the method (optional but useful for Lambda or HTTP integrations)
      integration=$(aws apigateway get-integration --rest-api-id $API_ID --resource-id $resource_id --http-method $method --query 'uri' --output text)

      # If there's an integration, import it
      if [ "$integration" != "None" ]; then
        # Check if the integration block exists in api-gateway.tf, if not create it
        if ! grep -q "aws_api_gateway_integration.${HUMAN_READABLE_NAME}_${resource_path//\//_}_${method}" api-gateway.tf; then
          echo "Creating Terraform block for aws_api_gateway_integration.${HUMAN_READABLE_NAME}_${resource_path//\//_}_${method}"
          echo "
resource \"aws_api_gateway_integration\" \"${HUMAN_READABLE_NAME}_${resource_path//\//_}_${method}\" {
  rest_api_id            = aws_api_gateway_rest_api.api_$HUMAN_READABLE_NAME.id
  resource_id            = aws_api_gateway_resource.${HUMAN_READABLE_NAME}_${resource_path//\//_}.id
  http_method            = aws_api_gateway_method.${HUMAN_READABLE_NAME}_${resource_path//\//_}_${method}.http_method
  integration_http_method = \"POST\"  # Change based on integration type
  type                    = \"AWS_PROXY\"  # Change this depending on integration type (AWS_PROXY, HTTP, etc.)
}" >> api-gateway.tf
        fi

        # Import the integration into Terraform
        echo "Importing integration for method $method at resource $resource_path"
        terraform import aws_api_gateway_integration.${HUMAN_READABLE_NAME}_${resource_path//\//_}_${method} $API_ID/$resource_id/$method
      fi
    done
  done

  # Import the stage (e.g., dev)
  echo "Importing stage: $STAGE_NAME for API $HUMAN_READABLE_NAME"
  terraform import aws_api_gateway_stage.${HUMAN_READABLE_NAME}_${STAGE_NAME} $API_ID/$STAGE_NAME

  # Fetch deployment ID (for example, the latest deployment)
  deployment_id=$(aws apigateway get-deployments --rest-api-id $API_ID --query 'items[0].id' --output text)

  if [ "$deployment_id" != "None" ]; then
    # Check if the deployment block exists in api-gateway.tf, if not create it
    if ! grep -q "aws_api_gateway_deployment.${HUMAN_READABLE_NAME}_example_deployment" api-gateway.tf; then
      echo "Creating Terraform block for aws_api_gateway_deployment.${HUMAN_READABLE_NAME}_example_deployment"
      echo "
resource \"aws_api_gateway_deployment\" \"${HUMAN_READABLE_NAME}_example_deployment\" {
  rest_api_id = aws_api_gateway_rest_api.api_$HUMAN_READABLE_NAME.id
  stage_name  = \"$STAGE_NAME\"
}" >> api-gateway.tf
    fi

    # Import the deployment into Terraform
    echo "Importing deployment: $deployment_id for API $HUMAN_READABLE_NAME"
    terraform import aws_api_gateway_deployment.${HUMAN_READABLE_NAME}_example_deployment $API_ID/$deployment_id
  fi

  echo "Import complete for API Gateway: $HUMAN_READABLE_NAME"
done

echo "All API Gateways imported successfully!"
