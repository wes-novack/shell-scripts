#!/bin/bash
wifi_device=$(cat /proc/net/wireless | grep -Po ".*(?=: )")
gateway=$(ip route show default | awk '/default/ {print $3}')
name_server=$(resolvectl status $wifi | grep -Po "(?<=DNS Servers: ).*")

function compare_gateway() {
	gateway=$1
	name_server=$2
	if [[ $gateway == $name_server ]]
	then
		echo "gateway and name server match! Exiting"
	else
		echo "gateway and name server don't match! Rectification needed."
		echo "gateway: $gateway"
		echo "name_server: $name_server"
		echo ""
		echo "updating name_server"
		update_name_server $wifi_device $gateway
		echo "name_server updated!"
		echo "Connect at https://wifi.delta.com using Firefox!"
	fi
}

function update_name_server() {
	resolvectl dns $1 $2
}

compare_gateway $gateway $name_server
