host_discovery() {

    read -p "Interface: " iface

    sudo arp-scan --interface="$iface" --localnet \
    | awk '/^[0-9]/{print $1}' \
    > logs/live_hosts.txt

    echo
    echo "Hosts discovered:"
    cat logs/live_hosts.txt

    echo
    echo "Saved to logs/live_hosts.txt"
}
