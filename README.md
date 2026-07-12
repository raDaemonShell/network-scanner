# Advanced Bash Network Scanner

A simple but powerful network scanning tool built using Bash for Linux systems.  
It performs ARP-based host discovery and TCP port scanning using `/dev/tcp` and optional Nmap integration.

---



## Features

- ARP-based network host discovery
- Live host list generation
- TCP port scanning using Bash
- Modular script structure
- Optional service detection using Nmap
- Scan result logging

---

## Requirements

Make sure you are using a Linux system (Kali Linux recommended).



Install required tools below:

```bash
sudo apt update
sudo apt install arp-scan nmap
