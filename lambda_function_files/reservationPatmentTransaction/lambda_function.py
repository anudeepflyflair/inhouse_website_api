import requests
import json
import boto3
from requests.auth import HTTPBasicAuth  # Import HTTPBasicAuth

def get_parameter(param_name):
    ssm = boto3.client('ssm')
    response = ssm.get_parameter(Name=param_name, WithDecryption=True)
    return response['Parameter']['Value']

def lambda_handler(event, context):
    parameter_username = '/flairgate/vikramuser'
    parameter_password = '/flairgate/vikrampassword'
    
    # Retrieve username and password from Parameter Store
    username = get_parameter(parameter_username)
    password = get_parameter(parameter_password)
    
    new_email = event.get('email')
    new_phone_number = event.get('phoneNumber')

    reservation_number = event.get("ReservationNumber")
    first_name = event.get("Firstname")  # Corrected variable name
    last_name = event.get("Lastname")    # Corrected variable name
    base_url = 'https://flairair-api.intelisystraining.ca/RESTv1/reservations'
    url = '{}?reservationNumber={}&passengerFirstName={}&passengerLastName={}'.format(base_url, reservation_number, first_name, last_name)
    
    try:
        response = requests.get(url, auth=HTTPBasicAuth(username, password))
        response.raise_for_status()  # Raise an exception for 4xx or 5xx status codes
        passenger_data = response.json()
        
        #print("Passenger Data:", passenger_data)
        #print("This data from thirdparty API")
        
        print(passenger_data)
        
        #get keys from passenger data
        reservation_key = passenger_data[0]['key']
        bookinginformation_key = passenger_data[0]['bookingInformation']['key']
    
        print(reservation_key)
        print(bookinginformation_key)
        
        api_url = f'https://flairair-api.intelisystraining.ca/RESTv1/reservations/{reservation_key}/bookingInformation/{bookinginformation_key}'
        
        response = requests.get(api_url, auth=HTTPBasicAuth(username, password))
        response.raise_for_status()  # Raise an exception for 4xx or 5xx status codes
        passenger_timestamp_data = response.json()
        
        #print(passenger_timestamp_data)
        
        timestamp = passenger_timestamp_data['timestamp']
        #print("Time Stamp Data :",timestamp)
        
        #print(api_url)
        #print(reservation_key)
        #print(bookinginformation_key)
        #response = requests.get(api_url, auth=HTTPBasicAuth(username, password))
        payload = { 
            "contactInformation": {
                "name": first_name +", "+last_name,
                "email": new_email,
                "phoneNumber": new_phone_number
            },
            "timestamp": timestamp
        }
        response = requests.put(api_url, json=payload, auth=HTTPBasicAuth(username, password))
        response.raise_for_status()  # Raise an exception for 4xx or 5xx status codes
        return {
                        'statusCode': 200,
                        'body': f'Contact information updated successfully for the passenger {first_name} {last_name} with New Email ID {new_email} and with New Phone Number {new_phone_number}'
                    }


    except requests.HTTPError as e:
        return {
            'statusCode': e.response.status_code,
            'body': f'HTTP error occurred: {e.response.text}'
        }
    except Exception as e:
        return {
            'statusCode': 500,
            'body': f'An error occurred: {str(e)}'
        }    
