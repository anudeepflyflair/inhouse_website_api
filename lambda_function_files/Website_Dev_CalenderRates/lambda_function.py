import json
import requests
from datetime import datetime, timedelta

def lambda_handler(event, context):
    # Extract parameters from the event object
    departure_date = event.get('departureDate', "2024-12-05")
    city_pair = event.get('cityPair', "YYZ-YVR")
    passenger_count = event.get('passengerCount', "ADT:1")
    currency = event.get('currency', "CAD")
    
    # Initialize a list to store all travel details across the 5 months
    travel_details = []
    
    # Convert departure_date to a datetime object
    current_date = datetime.strptime(departure_date, "%Y-%m-%d")
    
    try:
        # Loop through each 30-day chunk to cover 5 months (150 days)
        for _ in range(5):  # 5 iterations to cover ~150 days
            # Format the URL for the API request
            url = f"https://flairair-api.intelisystraining.ca/RESTv1/travelOptions?daysAfterDeparture=30&passengerCounts={passenger_count}&currency={currency}&departure={current_date.strftime('%Y-%m-%d')}&cityPair={city_pair}"
            
            # Send GET request to the API
            response = requests.get(url)
            response.raise_for_status()
            
            # Parse the response JSON
            data = response.json()
            
            # Process the returned options
            for option in data:
                departure_date = option.get('departureDate')
                fare_info = option.get('fareOptions', [{}])[0]  # Get first fare option if exists
                fare_charges = fare_info.get('fareCharges', [{}])[0]
                cheapest_fare = fare_charges.get('currencyAmounts', [{}])[0].get('totalAmount')
                
                if departure_date and cheapest_fare:
                    # Add each record as a dictionary to the travel_details list
                    travel_details.append({
                        "departure_date": departure_date,
                        "cheapest_fare": cheapest_fare
                    })
            
            # Move the current_date 30 days forward for the next iteration
            current_date += timedelta(days=30)
        
        # Return the response with all collected travel details
        return {
            'statusCode': 200,
            'body': travel_details
        }
    
    except requests.exceptions.RequestException as e:
        return {
            'statusCode': 500,
            'body': json.dumps({'error': str(e)})
        }
