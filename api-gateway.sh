#!/bin/bash

# Set your API Gateway ID and AWS Region
API_GATEWAY_ID="x9za9u6mei"
AWS_REGION="ca-central-1"

# Initialize Terraform (if not already done)
echo "Initializing Terraform..."
terraform init

# Create a new API file to hold all imported resources
API_FILE="api.tf"
echo "Creating $API_FILE to store imported API Gateway resources..."
echo "# API Gateway Resources" > $API_FILE

# Import the main API Gateway
echo "Creating and importing API Gateway: $API_GATEWAY_ID"
echo 'resource "aws_api_gateway_rest_api" "api_gateway" {}' >> $API_FILE
terraform import aws_api_gateway_rest_api.api_gateway "$API_GATEWAY_ID"

# Fetch all resources from the API Gateway
echo "Fetching resources for API Gateway..."
RESOURCES=$(aws apigateway get-resources --rest-api-id "$API_GATEWAY_ID" --region "$AWS_REGION" --query 'items[*].[id,path]' --output text)

# Import each resource if not already present in api.tf
echo "Importing API Gateway resources..."
while read -r RESOURCE_ID RESOURCE_PATH; do
  RESOURCE_NAME=$(echo "$RESOURCE_PATH" | sed 's/[\/{}]/_/g' | sed 's/_$//')
  
  # Check if resource block already exists
  if ! grep -q "resource \"aws_api_gateway_resource\" \"resource_$RESOURCE_NAME\"" "$API_FILE"; then
    echo "resource \"aws_api_gateway_resource\" \"resource_$RESOURCE_NAME\" {}" >> $API_FILE
    echo "Importing resource: $RESOURCE_PATH (ID: $RESOURCE_ID)"
    terraform import aws_api_gateway_resource.resource_"$RESOURCE_NAME" "$API_GATEWAY_ID/$RESOURCE_ID"
  else
    # Check if resource block exists but has different attributes
    RESOURCE_BLOCK=$(grep "resource \"aws_api_gateway_resource\" \"resource_$RESOURCE_NAME\"" "$API_FILE")
    if [ -z "$RESOURCE_BLOCK" ]; then
      echo "Resource $RESOURCE_PATH already exists in the configuration, skipping import."
    else
      # Check if resource ID and path match
      RESOURCE_ID_IN_FILE=$(echo "$RESOURCE_BLOCK" | grep -oP '(?<=id = ")[^"]*')
      RESOURCE_PATH_IN_FILE=$(echo "$RESOURCE_BLOCK" | grep -oP '(?<=path = ")[^"]*')
      if [ "$RESOURCE_ID" != "$RESOURCE_ID_IN_FILE" ] || [ "$RESOURCE_PATH" != "$RESOURCE_PATH_IN_FILE" ]; then
        # If attributes don't match, remove existing resource block and import again
        echo "Resource $RESOURCE_PATH has different attributes, removing existing block and importing again."
        sed -i "/resource \"aws_api_gateway_resource\" \"resource_$RESOURCE_NAME\"/,+1d" "$API_FILE"
        echo "resource \"aws_api_gateway_resource\" \"resource_$RESOURCE_NAME\" {}" >> $API_FILE
        terraform import aws_api_gateway_resource.resource_"$RESOURCE_NAME" "$API_GATEWAY_ID/$RESOURCE_ID"
      else
        echo "Resource $RESOURCE_PATH already exists in the configuration with matching attributes, skipping import."
      fi
    fi
  fi
done <<< "$RESOURCES"

# Import methods (GET, POST, etc.) for each resource if not already present
echo "Importing methods for each resource..."
for RESOURCE_ID in $(echo "$RESOURCES" | awk '{print $1}'); do
  METHODS=$(aws apigateway get-resource --rest-api-id "$API_GATEWAY_ID" --resource-id "$RESOURCE_ID" --region "$AWS_REGION" --query 'resourceMethods' --output json | jq -r 'keys[]')

  for METHOD in $METHODS; do
    METHOD_NAME=$(echo "$METHOD" | tr '[:upper:]' '[:lower:]')
    
    # Check if method block already exists
    if ! grep -q "resource \"aws_api_gateway_method\" \"method_${RESOURCE_ID}_${METHOD_NAME}\"" "$API_FILE"; then
      echo "resource \"aws_api_gateway_method\" \"method_${RESOURCE_ID}_${METHOD_NAME}\" {}" >> $API_FILE
      echo "Importing method: $METHOD for resource ID: $RESOURCE_ID"
      terraform import aws_api_gateway_method.method_"$RESOURCE_ID"_"$METHOD_NAME" "$API_GATEWAY_ID/$RESOURCE_ID/$METHOD"
    else
      # Check if method block exists but has different attributes
      METHOD_BLOCK=$(grep "resource \"aws_api_gateway_method\" \"method_${RESOURCE_ID}_${METHOD_NAME}\"" "$API_FILE")
      if [ -z "$METHOD_BLOCK" ]; then
        echo "Method $METHOD for resource ID $RESOURCE_ID already exists in the configuration, skipping import."
      else
        # Check if method name and resource ID match
        METHOD_NAME_IN_FILE=$(echo "$METHOD_BLOCK" | grep -oP '(?<=name = ")[^"]*')
        RESOURCE_ID_IN_FILE=$(echo "$METHOD_BLOCK" | grep -oP '(?<=resource_id = ")[^"]*')
        if [ "$METHOD_NAME" != "$METHOD_NAME_IN_FILE" ] || [ "$RESOURCE_ID" != "$RESOURCE_ID_IN_FILE" ]; then
          # If attributes don't match, remove existing method block and import again
          echo "Method $METHOD for resource ID $RESOURCE_ID has different attributes, removing existing block and importing again."
          sed -i "/resource \"aws_api_gateway_method\" \"method_${RESOURCE_ID}_${METHOD_NAME}\"/,+1d" "$API_FILE"
          echo "resource \"aws_api_gateway_method\" \"method_${RESOURCE_ID}_${METHOD_NAME}\" {}" >> $API_FILE
          terraform import aws_api_gateway_method.method_"$RESOURCE_ID"_"$METHOD_NAME" "$API_GATEWAY_ID/$RESOURCE_ID/$METHOD"
        else
          echo "Method $METHOD for resource ID $RESOURCE_ID already exists in the configuration with matching attributes, skipping import."
        fi
      fi
    fi
  done
done

# Import stages if not already present
echo "Importing stages..."
STAGES=$(aws apigateway get-stages --rest-api-id "$API_GATEWAY_ID" --region "$AWS_REGION" --query 'item[*].stageName' --output text)
for STAGE in $STAGES; do
  # Check if stage block already exists
  if ! grep -q "resource \"aws_api_gateway_stage\" \"stage_$STAGE\"" "$API_FILE"; then
    echo "Importing stage: $STAGE"
    terraform import aws_api_gateway_stage.stage_"$STAGE" "$API_GATEWAY_ID/$STAGE"
    echo "resource \"aws_api_gateway_stage\" \"stage_$STAGE\" {}" >> $API_FILE
  else
    # Check if stage block exists but has different attributes
    STAGE_BLOCK=$(grep "resource \"aws_api_gateway_stage\" \"stage_$STAGE\"" "$API_FILE")
    if [ -z "$STAGE_BLOCK" ]; then
      echo "Stage $STAGE already exists in the configuration, skipping import."
    else
      # Check if stage name matches
      STAGE_NAME_IN_FILE=$(echo "$STAGE_BLOCK" | grep -oP '(?<=stage_name = ")[^"]*')
      if [ "$STAGE" != "$STAGE_NAME_IN_FILE" ]; then
        # If attributes don't match, remove existing stage block and import again
        echo "Stage $STAGE has different attributes, removing existing block and importing again."
        sed -i "/resource \"aws_api_gateway_stage\" \"stage_$STAGE\"/,+1d" "$API_FILE"
        echo "resource \"aws_api_gateway_stage\" \"stage_$STAGE\" {}" >> $API_FILE
        terraform import aws_api_gateway_stage.stage_"$STAGE" "$API_GATEWAY_ID/$STAGE"
      else
        echo "Stage $STAGE already exists in the configuration with matching attributes, skipping import."
      fi
    fi
  fi
done

# Import deployments if not already present
echo "Importing deployments..."
DEPLOYMENTS=$(aws apigateway get-deployments --rest-api-id "$API_GATEWAY_ID" --region "$AWS_REGION" --query 'items[*].id' --output text)
for DEPLOYMENT in $DEPLOYMENTS; do
  # Check if deployment block already exists
  if ! grep -q "resource \"aws_api_gateway_deployment\" \"deployment_$DEPLOYMENT\"" "$API_FILE"; then
    echo "Importing deployment: $DEPLOYMENT"
    terraform import aws_api_gateway_deployment.deployment_"$DEPLOYMENT" "$API_GATEWAY_ID/$DEPLOYMENT"
    echo "resource \"aws_api_gateway_deployment\" \"deployment_$DEPLOYMENT\" {}" >> $API_FILE
  else
    # Check if deployment block exists but has different attributes
    DEPLOYMENT_BLOCK=$(grep "resource \"aws_api_gateway_deployment\" \"deployment_$DEPLOYMENT\"" "$API_FILE")
    if [ -z "$DEPLOYMENT_BLOCK" ]; then
      echo "Deployment $DEPLOYMENT already exists in the configuration, skipping import."
    else
      # Check if deployment ID matches
      DEPLOYMENT_ID_IN_FILE=$(echo "$DEPLOYMENT_BLOCK" | grep -oP '(?<=id = ")[^"]*')
      if [ "$DEPLOYMENT" != "$DEPLOYMENT_ID_IN_FILE" ]; then
        # If attributes don't match, remove existing deployment block and import again
        echo "Deployment $DEPLOYMENT has different attributes, removing existing block and importing again."
        sed -i "/resource \"aws_api_gateway_deployment\" \"deployment_$DEPLOYMENT\"/,+1d" "$API_FILE"
        echo "resource \"aws_api_gateway_deployment\" \"deployment_$DEPLOYMENT\" {}" >> $API_FILE
        terraform import aws_api_gateway_deployment.deployment_"$DEPLOYMENT" "$API_GATEWAY_ID/$DEPLOYMENT"
      else
        echo "Deployment $DEPLOYMENT already exists in the configuration with matching attributes, skipping import."
      fi
    fi
  fi
done

echo "All API Gateway resources, methods, stages, and deployments have been imported successfully!"
echo "The api.tf file has been created with all necessary resources."
