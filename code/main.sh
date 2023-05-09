#!/usr/bin/env bash

source ./config.sh

jupyter nbconvert \
	--to 'html' \
	--ExecutePreprocessor.allow_errors=True \
	--ExecutePreprocessor.timeout=-1 \
	--FilesWriter.build_directory=../results \
	--execute query_redshift.ipynb

#run utility capsule 
curl -H "Content-Type: application/json" -u ${CUSTOM_KEY}: -X POST https://acmecorp-cfn-demo.codeocean.com/api/v1/computations --data-raw "$data_raw"