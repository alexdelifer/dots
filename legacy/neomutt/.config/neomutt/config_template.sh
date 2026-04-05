#!/usr/bin/env bash

MAIL_ROOT="~/Mail"

# Exchange Settings
DAVMAIL_URL="https://webmail.example.com/owa/"
DAVMAIL_CERT_HASH=""

DAVMAIL_ADDRESS=""
DAVMAIL_USERNAME='DOMAIN\\delifera'
DAVMAIL_PASSWORD=""

OI_LOCALFOLDER="${MAIL_ROOT}/alex.delifer@example.com/"
OI_ACCOUNTNAME="example"
OI_LOCAL="example-local"
OI_REMOTE="example-remote"
OI_ACCOUNT="example"

# Local davmail port proxies
DAVMAIL_HOST="localhost"
DAVMAIL_CALDAV="1080"
DAVMAIL_IMAP="1143"
DAVMAIL_LDAP="1389"
DAVMAIL_POP="1110"
DAVMAIL_SMTP="1025"

# Improve speed by setting foldersize low and remote sync deletes no
# Will skip emails older than foldersize limit
#DAVMAIL_FOLDERSIZE="0"
#OI_REMOTESYNCDELETE="yes"

DAVMAIL_FOLDERSIZE="500"
OI_REMOTESYNCDELETE="no"

GMAIL_SMTP_HOST="smtp.gmail.com"
GMAIL_SMTP_PORT="587"
GMAIL_ADDRESS="alex@gmail.com"
GMAIL_PASSWORD=""

### DONT TOUCH THIS

DAVMAIL_CONFIG="""
davmail.enableKeepalive=false
davmail.server=true
davmail.mode=Auto
davmail.url=${DAVMAIL_URL}
davmail.server.certificate.hash=${DAVMAIL_CERT_HASH}

davmail.caldavPort=${DAVMAIL_CALDAV}
davmail.imapPort=${DAVMAIL_IMAP}
davmail.ldapPort=${DAVMAIL_LDAP}
davmail.popPort=${DAVMAIL_POP}
davmail.smtpPort=${DAVMAIL_SMTP}

davmail.imapAutoExpunge=false
davmail.enableKeepalive=false

davmail.folderSizeLimit=${DAVMAIL_FOLDERSIZE}
davmail.logFilePath=/dev/null
davmail.imapAlwaysApproxMsgSize=true
davmail.showStartupBanner=false
"""
