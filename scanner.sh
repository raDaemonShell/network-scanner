#!/bin/bash

source config.conf
source modules/host_scan.sh
source modules/port_scan.sh

while true
do
    echo
    echo "===== NETWORK SCANNER ====="
    echo "1. Host Discovery"
    echo "2. Scan host ports"
    echo "3. Scan Discovered Hosts"
    echo "4. Service Scan"
    echo "5. Exit"	

    read -p "Choice: " choice

    case $choice in
        1) host_discovery ;;
	2) scan_single_host ;;
	3) scan_discovered_hosts ;;
	4) scan_services ;;
        5) exit ;;
        *) echo "Invalid choice" ;;
    esac
done
