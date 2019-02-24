#!/bin/bash
echo -n "Using: "
if which lftp; then
        read -rp "Username: " user
        lftp -u "$user" https://pub.delifer.ca
fi
