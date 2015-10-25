#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

if [ -z "$1" ];
   then echo "Hostname is required" 1>&2
   exit 1
fi

HOSTNAME=$1
HOSTNAME=$(echo "$HOSTNAME" | sed "s#\\.#\\-#g")

# Set the host name
hostname $HOSTNAME
echo $HOSTNAME > /etc/hostname

sed -i "2i127.0.1.1 $HOSTNAME" /etc/hosts