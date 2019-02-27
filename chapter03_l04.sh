#!/bin/bash

# You can copy and paste line by line to the Azure CloudShell (https://shell.azure.com) or even upload the file to your CloudShell and execute the file, or run "az login" on your laptop and execute the file from your laptop

echo "These are informational command lines as shown in the course"
az vm image list-publishers --location australiasoutheast --output table
az vm list-sizes --location australiasoutheast --output table
az vm image list-offers --location australiasoutheast --publisher Canonical --output table
az vm image list --location australiasoutheast --publisher Canonical --offer UbuntuServer --output table

echo "create a single Linux VM in the management subnet"
az vm create --image UbuntuLTS --generate-ssh-keys --location australiasoutheast --name acglinuxvm --resource-group acg --size Standard_D3_v2 --vnet-name vnet-acg --subnet management --nsg "" --output table

echo "Install the AADLoginForLinux VM extension on the VM"
az vm extension set --publisher Microsoft.Azure.ActiveDirectory.LinuxSSH --name AADLoginForLinux --resource-group acg --vm-name acglinuxvm

echo "Don't forget to assign the 'Virtual Machine User' or 'Virtual Machine Administrator' permissions to your AAD user before attempting to log in to the VM"