#!/usr/bin/env bash
BOLD=$(tput bold)
RED=$(tput setaf 1)
BLUE=$(tput setaf 4)
PURPLE=$(tput setaf 5)
RESET=$(tput sgr0)

# decrypt and read the config
source <(ansible-vault view ~/.config/neomutt/config.sh \
    --vault-password-file ~/.neomutt_config_key)

notify-send -h string:bgcolor:#3579a8 \
  -h string:fgcolor:#d0d0d0 \
  "Checking for new mail..."

# Kill all shell jobs
# pkill -9 davmail
pkill -9 offlineimap

# Configs
OI_CONFIG="""
[general]
maxconnections = 1
singlethreadperfolder = yes
holdconnectionopen = true
# keep alive 60 seconds
keepalive = 60
# autorefresh in 3 minutes
autorefresh = 3


accounts = ${OI_ACCOUNTNAME}

[Account ${OI_ACCOUNTNAME}]
localrepository = ${OI_LOCAL}
remoterepository = ${OI_REMOTE}

[Repository ${OI_LOCAL}]
type = Maildir
localfolders = ${OI_LOCALFOLDER}

[Repository ${OI_REMOTE}]
type = IMAP
remotehost = ${DAVMAIL_HOST}
remoteuser = ${DAVMAIL_USERNAME}
remotepass = ${DAVMAIL_PASSWORD}
remoteport = ${DAVMAIL_IMAP}
starttls = no
ssl = no
sync_deletes = ${OI_REMOTESYNCDELETE}
folderfilter = lambda foldername: foldername in [
      'INBOX',
      'Sent',
      'Drafts',
      'Trash',
      ]
"""
# folderfilter = lambda foldername: foldername in [
#       'INBOX',
#       'Sent',
#       'Archives/2016',
#       'Archives/2017',
#       'Archives/2018',
#       'Archives/2019',
#       'Archives/2020',
#       'Archives/2021',
#       'Drafts',
#       'Trash',
#       ]

# # Start davmail if it's not running
# if ps ax | grep "davmail.jar" | grep -v grep; then
#   echo "${BOLD}${RED}DAVMAIL:${RESET} Davmail is already running."
# else

# fi
  # |& grep --line-buffered -v 'DEBUG' \

davmail <(echo "$DAVMAIL_CONFIG") \
  |& sed -e "s/^/${BOLD}${RED}DAVMAIL:${RESET} /;" \
  |& grep --line-buffered -v 'DEBUG' \
  || echo "${BOLD}${RED}DAVMAIL:${RESET} Davmail is already running." &  # %1
sleep 3 # wait for davmail to start

# ZB Mail
offlineimap -c <(echo "$OI_CONFIG") -u basic -o 2>&1 \
  | sed -e "s/^/${BOLD}${PURPLE}IMAP:${RESET} /;" & # %2

# Personal Mail
gmi sync -C ~/Mail/alex@delifer.ca \
  | sed -e "s/^/${BOLD}${BLUE}GMAIL:${RESET} /;" & # 3

# Cleanup
wait %2 # wait for offlineimap to finish
# kill davmail now that offlineimap is done
kill $(ps ax | grep "/bin/java -jar /usr/share/java/davmail/davmail.jar" | grep -v grep | awk -F ' ' '{print $1}')
wait %3 # wait for gmi to finish
kill $(jobs -p) || true # kill all jobs or live to tell about it

# Update Notmuch
# notmuch new
~/.config/neomutt/scripts/tag-mail.sh

COUNT=$(notmuch count tag:unread)
if [ "${COUNT}" != 0 ]; then
	notify-send -h string:bgcolor:#3579a8 -h string:fgcolor:#d0d0d0 "MAIL MOTHERFUCKER !!" "${COUNT} new messages"
fi

echo "${COUNT} unread emails."
echo "Done!"
