#!/usr/bin/env bash

source ./config.sh

#run Redshift Data Connector Capsule
data_raw='{ 
  "capsule_id": "'"$target_capsule_id"'",
  "parameters": ["'"$sql_query"'", "'"$database"'", "'"$host"'", "'"$port"'", "'"$file_name"'", "'"$output_format"'"]
}'

start_computation=$(curl -H "Content-Type: application/json" -u ${CUSTOM_KEY}: -X POST https://${co_domain}/api/v1/computations --data-raw "$data_raw")

computation_id=$(echo $start_computation | /usr/bin/jq --raw-output '.id')

#must wait for state to reach completed before proceeding 
while true 
do 
    get_computation=$(curl -H "Content-Type: application/json" -u ${CUSTOM_KEY}: -X GET https://${co_domain}/api/v1/computations/${computation_id})
    computation_state=$(echo $get_computation | /usr/bin/jq --raw-output '.state')
    if [[ $computation_state == 'failed' ]]
    then
        echo "Computation ${computation_id} failed"
        exit 1 
    fi
    if [[ $computation_state == 'completed' ]]
    then
        echo "Computation ${computation_id} completed"
        break 
    fi
    sleep 10
done 

data_raw='{
    "name": "'"$data_asset_name"'",
    "description": "Data asset automatically generated using Redshift connector capsules",
    "mount": "'"$folder_name"'",
    "tags": ['"$data_asset_tags"'],
    "source": {
        "computation": {
            "id": "'"$computation_id"'"
            }
        }
}'

curl -H "Content-Type: application/json" -u ${CUSTOM_KEY}: -X POST https://${co_domain}/api/v1/data_assets --data-raw "$data_raw"