#!/usr/bin/env bash
# store vars in .env file 
touch .env

if [ -z $1 ]; then
  echo 'table_to_fetch="users"' >> .env
  table_to_fetch="users"
else
  echo table_to_fetch="${1}" >> .env
  table_to_fetch=$1
fi

if [ -z $2 ]; then
with_everyone="False"
else
with_everyone=$2
fi

target_capsule_id="85c320b6-69f8-45db-a91a-819f423f58c3"

data_raw='{ 
  "capsule_id": "'"$target_capsule_id"'",
  "parameters": ["'"$table_to_fetch"'", "'"$CO_COMPUTATION_ID"'", "'"$with_everyone"'"]
}'