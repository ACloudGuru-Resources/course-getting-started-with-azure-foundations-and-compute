#!/bin/bash

# You can copy and paste line by line to the Azure CloudShell (https://shell.azure.com), or run "az login" on your laptop and execute line by line from your laptop

echo "Register v2 feature of Backup service, this will take around 10 mins"
az feature register --namespace Microsoft.RecoveryServices --name InstantBackupandRecovery

echo "check if the feature shows registered"
az feature show --namespace Microsoft.RecoveryServices --name InstantBackupandRecovery

echo "create backup vault"
az backup vault create --name acgrecoveryvault --location australiasoutheast --resource-group acg --output table

echo "enable vm protection on Windows VM"
az backup protection enable-for-vm --vm acgwindows --resource-group acg --policy-name DefaultPolicy --vault-name acgrecoveryvault --output table

echo "start backup now"
az backup protection backup-now --container-name acgwindows --item-name acgwindows --retain-until 31-12-2019 --resource-group acg --vault-name acgrecoveryvault --output table