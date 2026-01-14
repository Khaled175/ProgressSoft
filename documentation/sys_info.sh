#!/bin/bash

# Fetching data
EXECUTED_BY=$(whoami)
HOSTNAME=$(hostname)
SERVER_IP=$(hostname -I | awk '{print $1}')
PUBLIC_IP=$(curl -s ifconfig.me || echo "N/A")
OS_INFO=$(lsb_release -ds)
KERNEL=$(uname -r)
ARCH=$(uname -m)
VIRT=$(systemd-detect-virt)
STIME=$(date)
TZONE=$(timedatectl | grep "Time zone" | awk '{print $3 " (" $4 " " $5 ")"}')
UPTIME=$(uptime -p)

# Resource Usage
MEM_TOTAL=$(free -h | awk '/^Mem:/ {print $2}')
MEM_USED=$(free -h | awk '/^Mem:/ {print $3}')
SWAP_USED=$(free -h | awk '/^Swap:/ {print $3}')
SWAP_TOTAL=$(free -h | awk '/^Swap:/ {print $2}')
CPU_CORES=$(nproc)

echo "System Information"
echo "• Executed By: $EXECUTED_BY"
echo "• Hostname: $HOSTNAME"
echo "• Server IP: $SERVER_IP"
echo "• Public IP: $PUBLIC_IP"
echo "• OS Type and Version: $OS_INFO"
echo "• Kernel Version: $KERNEL"
echo "• Architecture: $ARCH"
echo "• Virtualization: $VIRT"
echo "• Server Time: $STIME"
echo "• Timezone: $TZONE"
echo "• Uptime: $UPTIME"

echo "\nResource Usage"
echo "• Total Memory: $MEM_TOTAL"
echo "• Memory Usage: $MEM_USED / $MEM_TOTAL"
echo "• Swap Usage: $SWAP_USED / $SWAP_TOTAL"
echo "• CPU Cores: $CPU_CORES"
