#!/bin/bash
VPNAUTO='NomeDaVPN!'
UUID=$(nmcli con | grep "$VPNAUTO" | rev | awk '{print $3}' | rev)
while [ "true" ]
do
    VPNCON=$(nmcli con show --active | grep "$UUID")
    if [[ -z $VPNCON ]];
    then
        nmcli con up uuid $UUID
        sleep 10
    else
        echo $VPNCON
        sleep 30
    fi
done
