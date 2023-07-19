import boto3
import os
import pandas as pd
import redshift_connector
import sys

if (len(sys.argv) >= 3):
    query = str(sys.argv[1])
    database = str(sys.argv[2])
    host = str(sys.argv[3])
    port = int(sys.argv[4])
    host = str(sys.argv[3])
else:
    query = "SELECT * FROM tickit.users"
    database = "sample_data_dev"
    host = "acmecorp-cfn-demo-endpoint-endpoint-tvuxknj0hc5lueze2pff.147080935342.us-east-1.redshift-serverless.amazonaws.com"
    port = 5439
    file_name = "users_table"
#from config import table_to_fetch
#table_to_fetch = "users"
#if (len(sys.argv) >= 1):
#    table_to_fetch = str(sys.argv[1])
#else:
#    table_to_fetch = "users"

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