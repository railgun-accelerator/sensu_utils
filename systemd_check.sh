#!/bin/bash

check_services='dnsmasq named haproxy ocserv openvpn@server openvpn@udp53 pptpd railgun-blockip railgun-network railgun-ports railgun-traffic shadowsocks-libev-manager squid strongswan xl2tpd'

flag=0
for service in $check_services
do
	result=$(systemctl is-failed $service)
	if [ $result != "active" ]; then
		flag=1
		echo "Service "$service" Failed"
	fi
done

if [ $flag -eq 0 ]; then
	exit 0
else
	exit 2
fi
