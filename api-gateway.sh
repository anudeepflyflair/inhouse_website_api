#!/bin/bash

# List of your API Gateway IDs and their human-readable names
declare -A API_GATEWAYS=(
  ["x9za9u6mei"]="Website-Dev"
)

# Example stage name (this should be the same for all gateways if you're using the same stage)
STAGE_NAME="dev"

# Array of specific resource paths and methods to import
declare -A RESOURCES=(
  ["/v1/accessibilityRequest"]="GET"
  ["/v1/searchAncillary"]="GET"
  ["/v1/createReservation"]="POST"
  ["/v1/flightSelect"]="GET"
  ["/v1/lowFares"]="GET"
  ["/v1/paymentMethods"]="GET"
  ["/v1/paymentReservation"]="POST"
  ["/v1/seatSelection"]="GET"
  ["/v1/voucherCode"]="GET"
)

# Loop over each API Gateway ID and its human-readable name
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

  # Loop through each resource path and method to import
  for RESOURCE_PATH in "${!RESOURCES[@]}"; do
    METHOD="${RESOURCES[$RESOURCE_PATH]}"

    # Fetch resource ID using the API ID and resource path
    resource_id=$(aws apigateway get-resources --rest-api-id $API_ID --query "items[?path=='$RESOURCE_PATH'].id" --output text)

    if [ "$resource_id" == "None" ]; then
      echo "No resource found for path: $RESOURCE_PATH"
      continue
    fi

    # Check if the resource block exists in api-gateway.tf, if not create it
    if ! grep -q "aws_api_gateway_resource.${HUMAN_READABLE_NAME}_${RESOURCE_PATH//\//_}" api-gateway.tf; then
      echo "Creating Terraform block for aws_api_gateway_resource.${HUMAN_READABLE_NAME}_${RESOURCE_PATH//\//_}"
      echo "
resource \"aws_api_gateway_resource\" \"${HUMAN_READABLE_NAME}_${RESOURCE_PATH//\//_}\" {
  rest_api_id = aws_api_gateway_rest_api.api_$HUMAN_READABLE_NAME.id
  parent_id   = aws_api_gateway_rest_api.api_$HUMAN_READABLE_NAME.root_resource_id
  path_part   = \"$RESOURCE_PATH\"
}" >> api-gateway.tf
    fi

    # Import the resource into Terraform
    echo "Importing resource: $RESOURCE_PATH (ID: $resource_id)"
    terraform import aws_api_gateway_resource.${HUMAN_READABLE_NAME}_${RESOURCE_PATH//\//_} $API_ID/$resource_id

    # Check if the method block exists in api-gateway.tf, if not create it
    if ! grep -q "aws_api_gateway_method.${HUMAN_READABLE_NAME}_${RESOURCE_PATH//\//_}_${METHOD}" api-gateway.tf; then
      echo "Creating Terraform block for aws_api_gateway_method.${HUMAN_READABLE_NAME}_${RESOURCE_PATH//\//_}_${METHOD}"
      echo "
resource \"aws_api_gateway_method\" \"${HUMAN_READABLE_NAME}_${RESOURCE_PATH//\//_}_${METHOD}\" {
  rest_api_id   = aws_api_gateway_rest_api.api_$HUMAN_READABLE_NAME.id
  resource_id   = aws_api_gateway_resource.${HUMAN_READABLE_NAME}_${RESOURCE_PATH//\//_}.id
  http_method   = \"$METHOD\"
  authorization = \"CUSTOM\"  # Adjust as needed (e.g., for AWS IAM, Lambda, etc.)
}" >> api-gateway.tf
    fi

    # Import the method into Terraform
    echo "Importing method: $METHOD for resource $RESOURCE_PATH"
    terraform import aws_api_gateway_method.${HUMAN_READABLE_NAME}_${RESOURCE_PATH//\//_}_${METHOD} $API_ID/$resource_id/$METHOD

    # Fetch integration details for the method (if applicable)
    integration=$(aws apigateway get-integration --rest-api-id $API_ID --resource-id $resource_id --http-method $METHOD --query 'uri' --output text)

    if [ "$integration" != "None" ]; then
      # Check if the integration block exists in api-gateway.tf, if not create it
      if ! grep -q "aws_api_gateway_integration.${HUMAN_READABLE_NAME}_${RESOURCE_PATH//\//_}_${METHOD}" api-gateway.tf; then
        echo "Creating Terraform block for aws_api_gateway_integration.${HUMAN_READABLE_NAME}_${RESOURCE_PATH//\//_}_${METHOD}"
        echo "
resource \"aws_api_gateway_integration\" \"${HUMAN_READABLE_NAME}_${RESOURCE_PATH//\//_}_${METHOD}\" {
  rest_api_id            = aws_api_gateway_rest_api.api_$HUMAN_READABLE_NAME.id
  resource_id            = aws_api_gateway_resource.${HUMAN_READABLE_NAME}_${RESOURCE_PATH//\//_}.id
  http_method            = aws_api_gateway_method.${HUMAN_READABLE_NAME}_${RESOURCE_PATH//\//_}_${METHOD}.http_method
  integration_http_method = \"POST\"  # Change based on integration type
  type                    = \"AWS_PROXY\"  # Change this depending on integration type (AWS_PROXY, HTTP, etc.)
}" >> api-gateway.tf
      fi

      # Import the integration into Terraform
      echo "Importing integration for method $METHOD at resource $RESOURCE_PATH"
      terraform import aws_api_gateway_integration.${HUMAN_READABLE_NAME}_${RESOURCE_PATH//\//_}_${METHOD} $API_ID/$resource_id/$METHOD
    fi
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
