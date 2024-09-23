import json
import boto3

def lambda_handler(event, context):
    try:
        bucket_name = event['Records'][0]['s3']['bucket']['name']
        object_key = event['Records'][0]['s3']['object']['key']
        
        s3_client = boto3.client('s3')
        
        response = s3_client.get_object(Bucket=bucket_name, Key=object_key)
        
        file_content = response['Body'].read().decode('utf-8')
        
        print(f"File content: {file_content}")
        
        return {
            'statusCode': 200,
            'body': json.dumps(f"File {object_key} from bucket {bucket_name} processed successfully.")
        }

    except Exception as e:
        print(f"Error processing file {object_key} from bucket {bucket_name}: {str(e)}")
        
        return {
            'statusCode': 500,
            'body': json.dumps(f"Error processing file {object_key} from bucket {bucket_name}: {str(e)}")
        }