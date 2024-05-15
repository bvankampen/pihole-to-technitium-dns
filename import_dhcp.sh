#!/bin/bash

source settings.env


while read LINE; do
  IFS=',' read -ra ENTRY <<< "$LINE"
  MACFIELD=${ENTRY[0]}
  MAC=${MACFIELD/"dhcp-host="/""}
  IP=${ENTRY[1]}
  NAME=$(echo "${ENTRY[2]}" | awk '{print tolower($0)}')

  echo "Import $MAC -> $IP hostname: $NAME"
  URL="http://$API_HOST/api/dhcp/scopes/addReservedLease?token=$TOKEN&name=lan&ipAddress=$IP&hostName=$NAME&hardwareAddress=$MAC"

  # echo $URL
  RESULT=$(curl -s $URL)
  echo $RESULT
  # exit
done < $DHCP_FILE
