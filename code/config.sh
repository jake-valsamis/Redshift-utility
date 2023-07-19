#!/usr/bin/env bash

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

target_capsule_id="6d7efb1f-2803-427f-b96e-7a6dc76b0cfc"