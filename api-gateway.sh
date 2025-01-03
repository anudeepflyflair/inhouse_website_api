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

  # Import the API Gateway (Rest API)
  echo "Importing API Gateway: $HUMAN_READABLE_NAME"
  terraform import aws_api_gateway_rest_api.api_$HUMAN_READABLE_NAME $API_ID

  # Fetch all resources for the given API
  resources=$(aws apigateway get-resources --rest-api-id $API_ID --query 'items[*].id' --output text)

  # Iterate through each resource and import the resource and its methods
  for resource_id in $resources; do
    # Fetch the resource path (for better naming in Terraform)
    resource_path=$(aws apigateway get-resource --rest-api-id $API_ID --resource-id $resource_id --query 'path' --output text)

    # Import the resource into Terraform
    echo "Importing resource: $resource_path (ID: $resource_id)"
    terraform import aws_api_gateway_resource.${HUMAN_READABLE_NAME}_${resource_path//\//_} $API_ID/$resource_id

    # Fetch methods for the resource (GET, POST, etc.)
    methods=$(aws apigateway get-methods --rest-api-id $API_ID --resource-id $resource_id --query 'items[*].httpMethod' --output text)

    # Iterate through each method and import it
    for method in $methods; do
      echo "Importing method: $method for resource $resource_path"
      terraform import aws_api_gateway_method.${HUMAN_READABLE_NAME}_${resource_path//\//_}_${method} $API_ID/$resource_id/$method

      # Fetch integration details for the method (optional but useful for Lambda or HTTP integrations)
      integration=$(aws apigateway get-integration --rest-api-id $API_ID --resource-id $resource_id --http-method $method --query 'uri' --output text)

      # Import the integration if it exists
      if [ "$integration" != "None" ]; then
        echo "Importing integration for method $method at resource $resource_path"
        terraform import aws_api_gateway_integration.${HUMAN_READABLE_NAME}_${resource_path//\//_}_${method}_integration $API_ID/$resource_id/$method
      fi
    done
  done

  # Import the stage (e.g., dev)
  echo "Importing stage: $STAGE_NAME for API $HUMAN_READABLE_NAME"
  terraform import aws_api_gateway_stage.${HUMAN_READABLE_NAME}_${STAGE_NAME} $API_ID/$STAGE_NAME

  # Optional: Import the deployment (if needed)
  # Fetch deployment ID (for example, the latest deployment)
  deployment_id=$(aws apigateway get-deployments --rest-api-id $API_ID --query 'items[0].id' --output text)

  if [ "$deployment_id" != "None" ]; then
    echo "Importing deployment: $deployment_id for API $HUMAN_READABLE_NAME"
    terraform import aws_api_gateway_deployment.${HUMAN_READABLE_NAME}_example_deployment $API_ID/$deployment_id
  fi

  echo "Import complete for API Gateway: $HUMAN_READABLE_NAME"
done

echo "All API Gateways imported successfully!"
