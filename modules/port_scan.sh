scan_port() {

    local ip="$1"
    local port="$2"

    timeout 1 bash -c \
    "echo >/dev/tcp/$ip/$port" \
    2>/dev/null

    if [ $? -eq 0 ]
    then
        echo "[OPEN] $port"
    fi
}

scan_single_host() {

    read -p "Target IP: " ip

    ports=(21 22 23 25 53 80 110 139 143 443 445 3389)

    echo
    echo "Scanning $ip..."

    for port in "${ports[@]}"
    do
        timeout 1 bash -c \
        "echo >/dev/tcp/$ip/$port" \
        2>/dev/null

        if [ $? -eq 0 ]
        then
            echo "[OPEN] Port $port"
        fi
    done

}


scan_discovered_hosts() {

    ports=(22 80 443 445 3389)

    while read -r ip
    do
        echo
        echo "===== $ip ====="

        for port in "${ports[@]}"
        do
            timeout 1 bash -c \
            "echo >/dev/tcp/$ip/$port" \
            2>/dev/null

            if [ $? -eq 0 ]
            then
                echo "[OPEN] $port"
            fi
        done

    done < logs/live_hosts.txt
}


scan_services() {

    read -p "Target IP: " ip

    echo "Service scan for $ip"
    nmap -sV "$ip"
}
