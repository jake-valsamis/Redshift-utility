#!/usr/bin/env bash

#customer specific parameters
co_domain="acmecorp-cfn-demo.codeocean.com"
target_capsule_id="6d7efb1f-2803-427f-b96e-7a6dc76b0cfc"

#app panel parameters
if [ $# -eq 0 ]; then
    echo "No arguments supplied"
fi

if [ -z "${1}" ]; then
  sql_query="SELECT * FROM tickit.users"
else
  sql_query="${1}"
fi

if [ -z "${2}" ]; then
  database="sample_data_dev"
else
  database="${2}"
fi

if [ -z "${3}" ]; then
  host="Default Host"
else
  host="${3}"
fi

if [ -z "${4}" ]; then
  port="5439"
else
  port="${4}"
fi

if [ -z "${5}" ]; then
  file_name="users_table"
else
  file_name="${5}"
fi

if [ -z "${6}" ]; then
  data_asset_name="Users table from tickit schema"
else
  data_asset_name="${6}"
fi

if [ -z "${7}" ]; then
  folder_name="users_table"
else
  folder_name="${7}"
fi

if [ -z "${7}" ]; then
  tags="Redshift:users:csv"
else
  tags="${7}"
fi

IFS=':' read -ra tags2 <<< "$tags"
data_asset_tags=${tags2[@]}
data_asset_tags=$(sed -E 's/[^[:space:]]+/"&"/g' <<< "$data_asset_tags")
data_asset_tags=$(echo ${data_asset_tags// /, })
# for i in "${data_asset_tags[@]:1}"; do
#   #data_asset_tags="${data_asset_tags}, \"${i}\""
#   echo $i
#   echo 
# done