[![Code Ocean Logo](images/CO_logo_135x72.png)](http://codeocean.com/product)

<hr>

# Redshift Data Connector - Data Asset Generation

This is a capsule uses the Code Ocean API to run its companion capsule, **Redshift Data Connector**, and automatically create a data asset from the result.

Note: In order to use this capsule, you must change two variables in config.sh:
- set co_domain to your Code Ocean co_domain
- set target_capsule_id to the ID of your newly duplicated **Redshift Data Connector** capsule

There is no input or output data for this capsule. 

## Secrets

This capsule requires a Custom Key secret whose value is your Code Ocean API Personal Access Token. Both of which can be created in the Account page.  

## App Panel Parameters

### Query Parameters

SQL Query
- Query to execute 

### Redshift Parameters

Database
- The Redshift database to query. 

Host
- Hostname address in the form [name].[id].[region].redshift.amazonaws.com or [name].[id].[region].redshift-serverless.amazonaws.com

Port
- Port number for your Redshift endpoint (usually 5439). 

### Output Parameters

Output File Name
- File name to use for the query output. Note that this should not include the file extension or any special characters. 

### Metadata Parameters

Data Asset Name
- Name for the data asset this capsule will create. 

Folder Name
- The folder name (i.e. mount point) for the created data asset.

Tags
- Tags for the created data asset, separated by ':' delimiters. (e.g. "Redshift:csv")

<hr>

[Code Ocean](https://codeocean.com/) is a cloud-based computational platform that aims to make it easy for researchers to share, discover, and run code.<br /><br />
[![Code Ocean Logo](images/CO_logo_68x36.png)](https://www.codeocean.com)


