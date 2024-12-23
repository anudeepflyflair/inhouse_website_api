import requests
import json
import boto3
from requests.auth import HTTPBasicAuth

def get_parameter(param_name):
    ssm = boto3.client('ssm')
    response = ssm.get_parameter(Name=param_name, WithDecryption=True)
    return response['Parameter']['Value']

def lambda_handler(event, context):
    # Log the entire event for debugging
    print("Event received:", json.dumps(event))
    
    # Ensure 'queryStringParameters' exists and extract reservationKey
    if 'queryStringParameters' not in event or not event['queryStringParameters']:
        return {
            'statusCode': 400,
            'body': 'Missing queryStringParameters in request'
        }

    # Extract reservationKey from query parameters
    reservation_key = event['queryStringParameters'].get('reservationKey')
    if not reservation_key:
        return {
            'statusCode': 400,
            'body': 'Missing reservationKey in query parameters'
        }
    print(reservation_key)
    # Retrieve and parse request body
    request_body = event.get('body')
    print("requestbody")
    print(request_body)
    if request_body:
        try:
            event_body = json.loads(request_body) if isinstance(request_body, str) else request_body
        except json.JSONDecodeError:
            return {
                'statusCode': 400,
                'body': 'Invalid JSON in request body'
            }
    else:
        return {
            'statusCode': 400,
            'body': 'Missing request body'
        }

    # Retrieve username and password from Parameter Store
    username = get_parameter('/flairgate/apiuser')
    password = get_parameter('/flairgate/apipassword')

    # API endpoint URL with reservationKey
    url = f"https://flairair-api.intelisystraining.ca/RESTv1/reservations/{reservation_key}/ancillaryPurchases"
    
    # Make the POST request to the API
    response = requests.post(
        url,
        auth=HTTPBasicAuth(username, password),
        headers={"Content-Type": "application/json"},
        json=event_body
    )

    print("Response from API:", response)
    
    # Return the response from the API
    if response.status_code == 201:
        return {
            'statusCode': 201,
            'body': json.dumps(response.json())
        }
    else:
        return {
            'statusCode': response.status_code,
            'body': response.text
        }