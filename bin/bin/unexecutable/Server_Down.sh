#!/bin/bash

echo "enter the URL or IP address"
read ip_url

ping $ip_url

if [ $? -eq 0 ]; then
    echo
else
    echo
fi
