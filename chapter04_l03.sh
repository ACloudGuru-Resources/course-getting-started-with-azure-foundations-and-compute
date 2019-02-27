#!/bin/bash

# You can copy and paste line by line to the Azure CloudShell (https://shell.azure.com), or run "az login" on your laptop and execute line by line from your laptop

# Make sure to set the value of ACCOUNTNAME to what you set it to in `chapter04_l01.sh`
ACCOUNTNAME=""

echo "Set the Microsoft.Storage vnet service endpoint on the vnet"
az network vnet subnet update --vnet-name vnet-acg001 --name management --service-endpoints Microsoft.Storage --resource-group acg001 --output table

echo "query the subnet id of our management subnet"
subnetid=$(az network vnet subnet show --resource-group acg001 --vnet-name vnet-acg001 --name management --query id --output tsv)

echo "add the vnet endpoint to the management subnet"
az storage account network-rule add --resource-group acg001 --account-name ${ACCOUNTNAME} --subnet ${subnetid} --output table

echo "Deny all other networks access to the storage account"
az storage account update --resource-group acg001 --name ${ACCOUNTNAME} --default-action Deny --output table