import json
# headers/ urls
def lambda_handler(event, context):
    # TODO implement
    print (event)
    return {
        'statusCode': 200,
        'body': event
    }
