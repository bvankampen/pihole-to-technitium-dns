#!/bin/bash

source settings.env

while read LINE; do
  RECORD=($LINE)
  IP=${RECORD[0]}
  A=${RECORD[1]}
  echo "Import $A A $IP"
  URL="http://$API_HOST/api/zones/records/add?token=$TOKEN&domain=$A&type=A&overwrite=true&ipAddress=$IP&ptr=true"
  # echo $URL
  RESULT=$(curl -s $URL)
  echo $RESULT
  # exit
done < $DNS_FILE
