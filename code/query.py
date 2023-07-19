import boto3
import os
import pandas as pd
import redshift_connector
import sys

if (len(sys.argv) >= 4):
    query = sys.argv[1]
    database = sys.argv[2]
    host = sys.argv[3]
    port = int(sys.argv[4])
    file_name = sys.argv[5]
else:
    query = "SELECT * FROM tickit.users"
    database = "sample_data_dev"
    host = "acmecorp-cfn-demo-endpoint-endpoint-tvuxknj0hc5lueze2pff.147080935342.us-east-1.redshift-serverless.amazonaws.com"
    port = 5439
    file_name = "users_table"

if host == "Default Host":
    host = "acmecorp-cfn-demo-endpoint-endpoint-tvuxknj0hc5lueze2pff.147080935342.us-east-1.redshift-serverless.amazonaws.com"
    
#set up and establish connection
client = boto3.client('redshift-serverless')

creds = client.get_credentials(
    workgroupName='default'
)

conn = redshift_connector.connect(
    host=host,
    port=port,
    database=database,
    user=creds['dbUser'],
    password=creds['dbPassword']
)

cursor = conn.cursor()

#fetch table as dataframe
cursor.execute(query)
df = cursor.fetch_dataframe()

#preview table and save it as a csv
print(df.head())
df.to_csv(f"../results/{file_name}.csv")  

#close connection
conn.close()