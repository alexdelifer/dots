#!/usr/bin/env bash
BOLD=$(tput bold)
RED=$(tput setaf 1)
BLUE=$(tput setaf 4)
PURPLE=$(tput setaf 5)
RESET=$(tput sgr0)

# decrypt and read the config
source <(ansible-vault view ~/.config/neomutt/config.sh \
    --vault-password-file ~/.neomutt_config_key)


# replace \\ with \ in username
DAVMAIL_USERNAME=$(echo "${DAVMAIL_USERNAME}" | sed 's/\\\\/\\/g')
#echo "DAVMAIL_USERNAME: ${DAVMAIL_USERNAME}"

# Configs
MSMTP_CONFIG="""
defaults
auth on
tls on
tls_trust_file /etc/ssl/certs/ca-certificates.crt
logfile /dev/null

account gmail
host ${GMAIL_SMTP_HOST}
port ${GMAIL_SMTP_PORT}
from ${GMAIL_ADDRESS}
user ${GMAIL_ADDRESS}
password ${GMAIL_PASSWORD}

account ${OI_ACCOUNTNAME}
tls off
auth plain
host ${DAVMAIL_HOST}
port ${DAVMAIL_SMTP}
from ${DAVMAIL_ADDRESS}
user ${DAVMAIL_USERNAME}
password ${DAVMAIL_PASSWORD}
"""

# ZB Mail
davmail <(echo "$DAVMAIL_CONFIG") \
  |& sed -e "s/^/${BOLD}${RED}DAVMAIL:${RESET} /;" &  # %1

sleep 2 # wait for davmail to start

msmtp -C <(echo "$MSMTP_CONFIG") "$@" \
  |& grep --line-buffered -v 'DEBUG' \
  |& sed -e "s/^msmtp: /${BOLD}${RED}MSMTP:${RESET} /;"

echo "Done!"
