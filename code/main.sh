#!/usr/bin/env bash

source ./config.sh

#run Redshift Data Connector Capsule
data_raw='{ 
  "capsule_id": "'"$target_capsule_id"'",
  "parameters": ["'"$sql_query"'", "'"$database"'", "'"$host"'", "'"$port"'", "'"$file_name"'"]
}'

curl -H "Content-Type: application/json" -u ${CUSTOM_KEY}: -X POST https://acmecorp-cfn-demo.codeocean.com/api/v1/computations --data-raw "$data_raw"


#must wait for state to reach completed before proceeding 
# while true 
# do 
#     get_computation=$(curl -H "Content-Type: application/json" -u ${CUSTOM_KEY}: -X GET https://acmecorp-cfn-demo.codeocean.com/api/v1/computations/${computation_id})
#     computation_state=$(echo $get_computation | /usr/bin/jq --raw-output '.state')
#     if [[ $computation_state == 'failed' ]]
#     then
#         echo "Computation ${computation_id} failed"
#         exit 1 
#     fi
#     if [[ $computation_state == 'completed' ]]
#     then
#         echo "Computation ${computation_id} completed"
#         break 
#     fi
#     sleep 10
# done 

# #create data asset from result
# asset_description="Subset of tickit database in .csv format"
# mount_name="${table_to_fetch}_table"
# redshift_db="sample_data_dev"

# data_raw='{
#     "name": "Redshift tickit schema: '"$table_to_fetch"' table",
#     "description": "'"$asset_description"'",
#     "mount": "'"$mount_name"'",
#     "tags": [ "'"$table_to_fetch"'", "Redshift", "CSV", "tickit" ],
#     "custom_metadata":{
#         "Redshift DB": "'"$redshift_db"'"
#     },
#     "source": {
#         "computation": {
#             "id": "'"$computation_id"'"
#             }
#         }
# }'
# create_data_asset=$(curl -H "Content-Type: application/json" -u ${CUSTOM_KEY}: -X POST https://acmecorp-cfn-demo.codeocean.com/api/v1/data_assets --data-raw "$data_raw")