#!/bin/bash

# You can copy and paste line by line to the Azure CloudShell (https://shell.azure.com), or run "az login" on your laptop and execute line by line from your laptop

# Add a value to the next line and test if that name is taken or not
# make sure you change the name parameter to something that the first step said is okay to use
ACCOUNTNAME=""

echo "test if this name is okay to use"
az storage account check-name --name ${ACCOUNTNAME}

echo "create the storage account"
az storage account create --name ${ACCOUNTNAME} --location australiasoutheast --resource-group acg001 --kind StorageV2 --https-only --sku Standard_LRS --output table