#!/bin/bash
set -ex

az login --service-principal -u ${AZURE_CLIENT_ID} -p ${AZURE_CLIENT_SECRET} --tenant ${AZURE_TENANT_ID}

newIp="$(dig +short myip.opendns.com @resolver1.opendns.com)"
oldIp="$(az network dns record-set a show --resource-group ${AZURE_DDNS_RESOURCE_GROUP_NAME} --zone-name ${AZURE_DDNS_ZONE_NAME} --name ${AZURE_DDNS_RECORD_NAME} -o tsv --query "aRecords[0].ipv4Address")"

if [[ "$newIp" == "$oldIp" ]]; then
    echo "IP has not been updated"
else
    echo "Updating IP to ${newIp}"
    az network dns record-set a remove-record --resource-group ${AZURE_DDNS_RESOURCE_GROUP_NAME} --zone-name ${AZURE_DDNS_ZONE_NAME} --record-set-name ${AZURE_DDNS_RECORD_NAME} --ipv4-address ${oldIp} --keep-empty-record-set
    az network dns record-set a add-record --resource-group ${AZURE_DDNS_RESOURCE_GROUP_NAME} --zone-name ${AZURE_DDNS_ZONE_NAME} --record-set-name ${AZURE_DDNS_RECORD_NAME} --ipv4-address ${newIp}
fi