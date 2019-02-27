#!/bin/bash

# You can copy and paste line by line to the Azure CloudShell (https://shell.azure.com), or run "az login" on your laptop and execute line by line from your laptop

# Make sure to set the value of ACCOUNTNAME to what you set it to in `chapter04_l01.sh`
ACCOUNTNAME=""

echo "create file share on storage account"
az storage share create --name acgfileshare --account-name ${ACCOUNTNAME} --output table