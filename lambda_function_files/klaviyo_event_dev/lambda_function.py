def lambda_handler(event, context):
    import requests
    import json
    import boto3

    def get_parameter(param_name):
        """Retrieve parameter from AWS SSM Parameter Store."""
        ssm = boto3.client('ssm')
        response = ssm.get_parameter(Name=param_name, WithDecryption=True)
        return response['Parameter']['Value']

    try:
        event_body = json.loads(event['body']) if isinstance(event['body'], str) else event['body']
    except Exception as e:
        return {'statusCode': 400, 'body': json.dumps({'error': 'Invalid JSON in request body', 'details': str(e)})}

    try:
        apiKey = get_parameter('/klaviyo/prod/api/key')
    except Exception as e:
        return {'statusCode': 500, 'body': json.dumps({'error': 'Failed to retrieve company_id', 'details': str(e)})}

    klaviyo_url = f"https://a.klaviyo.com/api/events"

    headers = {
        "revision": "2024-10-15",
        "Content-Type": "application/vnd.api+json",
        "Accept": "application/vnd.api+json",
        "Authorization": apiKey
    }

    try:
        response = requests.post(klaviyo_url, headers=headers, json=event_body)
        print("Klaviyo Response Status Code:", response.status_code)

        if response.status_code == 202:
            return {
                'statusCode': 202,
                'body': json.dumps({'message': 'Request successfully accepted by Klaviyo.'})
            }
        elif response.status_code >= 200 and response.status_code < 300:
            try:
                return {'statusCode': response.status_code, 'body': json.dumps(response.json())}
            except json.JSONDecodeError:
                return {'statusCode': response.status_code, 'body': response.text}
        else:
            return {
                'statusCode': response.status_code,
                'body': json.dumps({'error': 'Request to Klaviyo failed', 'details': response.text})
            }
    except requests.exceptions.RequestException as e:
        return {'statusCode': 500, 'body': json.dumps({'error': 'Failed to connect to Klaviyo', 'details': str(e)})}
