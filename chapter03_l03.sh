#!/bin/bash

# You can copy and paste line by line to the Azure CloudShell (https://shell.azure.com) or even upload the file to your CloudShell and execute the file, or run "az login" on your laptop and execute the file from your laptop

echo "These are informational command lines as shown in the course"
az vm list-sizes --location australiasoutheast --output table
az vm image list-publishers --location australiasoutheast --output table
az vm image list-offers --location australiasoutheast --publisher MicrosoftWindowsServer --output table
az vm image list --location australiasoutheast --publisher MicrosoftWindowsServer --offer WindowsServer --output table

echo "Create a single Windows Server 2019 with user name david"
az vm create --image Win2019Datacenter --admin-username david --location australiasoutheast --name acgwindowstest --resource-group acg001 --size Standard_D3_v2 --vnet-name vnet-acg001 --subnet management --nsg "" --output table

echo "Create a VM Scale Set of 3 instances with the user name david"
az vmss create --image Win2019Datacenter --admin-username david --instance-count 3  --location australiasoutheast --name acgwindowsvmss --resource-group acg --vm-sku Standard_D3_v2 --vnet-name vnet-acg --subnet management --nsg ""