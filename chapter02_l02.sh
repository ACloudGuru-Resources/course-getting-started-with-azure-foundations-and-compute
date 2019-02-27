#!/bin/bash

# You can copy and paste line by line to the Azure CloudShell (https://shell.azure.com) or even upload the file to your CloudShell and execute the file, or run "az login" on your laptop and execute the file from your laptop

echo "create the resource group first"
az group create --name acg001 --location australiasoutheast

echo "create the vnet"
az network vnet create --name vnet-acg001 --resource-group acg001 --address-prefixes 192.168.0.0/16 --location australiasoutheast

echo "create the subnets"
az network vnet subnet create --resource-group acg001 --name GatewaySubnet --address-prefixes 192.168.0.0/28 --vnet-name vnet-acg001
az network vnet subnet create --resource-group acg001 --name management --address-prefixes 192.168.1.0/24 --vnet-name vnet-acg001

echo "create the NSGs and NSG rules"
az network nsg create --name nsg-management --resource-group acg001 --location australiasoutheast
az network nsg rule create --access Allow --destination-port-ranges 3389 --source-address-prefixes Internet --name "allow RDP" --nsg-name nsg-management --resource-group acg001 --priority 100
az network nsg rule create --access Allow --destination-port-ranges 22 --source-address-prefixes Internet --name "allow SSH" --nsg-name nsg-management --resource-group acg001 --priority 110

echo "associate the NSG to the management subnet"
az network vnet subnet update --network-security-group nsg-management --name management --vnet-name vnet-acg001 --resource-group acg001

echo "now check the result in the portal"