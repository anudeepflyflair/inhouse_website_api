import json
import requests
import logging
import boto3

def lambda_handler(event, context):
    # API endpoint
    url = "https://validation-api.blueribbonbags.com/api/Service/Purchase"

    # Retrieve bearer token from AWS Systems Manager Parameter Store
    ssm_client = boto3.client('ssm')
    try:
        parameter = ssm_client.get_parameter(Name='/BRB/dev/BearerToken', WithDecryption=True)
        bearer_token = parameter['Parameter']['Value']
    except Exception as e:
        logging.error(f"Error retrieving bearer token: {str(e)}")
        return {
            "statusCode": 500,
            "body": json.dumps({"error": "Failed to retrieve bearer token."})
        }

    # Request headers
    headers = {
        "Authorization": f"Bearer {bearer_token}",
        "Content-Type": "application/json"
    }

    try:
        # Extract request body from the API Gateway event
        request_body = event.get("body", "{}")

        # Ensure request_body is a valid JSON string
        if isinstance(request_body, str):
            request_body = json.loads(request_body)

        # Make the POST request
        response = requests.post(url, headers=headers, json=request_body)

        # Parse the response body
        response_body = json.loads(response.text)

        # Log the response
        logging.info(f"Response status code: {response.status_code}")
        logging.info(f"Response body: {json.dumps(response_body, indent=4)}")

        # Check for errors in the response
        if response_body.get("Errors"):
            # Return only the error message if errors exist
            error_message = response_body["Errors"][0].get("ErrorMessage", "Unknown error")
            return {
                "statusCode": 400,
                "body": error_message
            }

        # Format the successful response directly
        formatted_response = {
            "ServiceNumber": response_body['Data'].get('ServiceNumber'),
            "TotalPrice": response_body['Data'].get('TotalPrice'),
            "TotalCharge": response_body['Data'].get('TotalCharge'),
            "Status": response_body.get('Status'),
            "StatusCode": response_body.get('StatusCode')
        }

        return {
            "statusCode": response.status_code,
            "body": formatted_response
        }
    except Exception as e:
        logging.error(f"Error occurred: {str(e)}")
        return {
            "statusCode": 500,
            "body": json.dumps({"error": str(e)})
        }
