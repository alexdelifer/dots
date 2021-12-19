#!/usr/bin/env bash

UUID=$(uuidgen)
work="zimmerbiomet.com"

mainmaildir="alex@delifer.ca"
workmaildir="alex.delifer@zimmerbiomet.com"

# get new mail
notmuch new

echo "Tagging mail..."

# retag "new" messasges "inbox" and "unread"
echo "New messages"
notmuch tag +inbox +unread -new -- tag:new

# Directed to me
# notmuch tag +inbox -- \
#   to:alexandre.delifer@${ZB} or \
#   to:alex.delifer@${ZB} or \
#   to:alex@delifer.ca or \
#   to:alexdelifer@gmail.com or \
#   to:cheetybot@gmail.com

# Work related
echo "Work messages"
notmuch tag +work path:${workmaildir}/'**'

# Private tracker disabled
echo "Disabled Accounts"
notmuch tag +disacct -- \
  subject:'account disable' and \
  to:'cheetybot@gmail.com'

notmuch tag +cbot -- \
  to:'cheetybot@gmail.com'

# Archive by year
echo "Archiving old messages"
notmuch tag +archive -inbox +2011 date:"2011-01-01".."2011-12-31" 
notmuch tag +archive -inbox +2012 date:"2012-01-01".."2012-12-31" 
notmuch tag +archive -inbox +2013 date:"2013-01-01".."2013-12-31" 
notmuch tag +archive -inbox +2014 date:"2014-01-01".."2014-12-31" 
notmuch tag +archive -inbox +2015 date:"2015-01-01".."2015-12-31" 
notmuch tag +archive -inbox +2016 date:"2016-01-01".."2016-12-31" 
notmuch tag +archive -inbox +2017 date:"2017-01-01".."2017-12-31" 
notmuch tag +archive -inbox +2018 date:"2018-01-01".."2018-12-31" 
notmuch tag +archive -inbox +2019 date:"2019-01-01".."2019-12-31" 
notmuch tag +archive -inbox +2020 date:"2020-01-01".."2020-12-31"

# 1 years of emails inbox
notmuch tag +archive -inbox date:"2010-01-01".."1years" 

echo "Tag by Path"

notmuch tag +inbox path:${workmaildir}/INBOX/'**'

notmuch tag +archive -inbox path:${workmaildir}/INBOX.Archives/'**'
notmuch tag +archive -inbox +2016 path:${workmaildir}/INBOX.Archives.2016/'**'
notmuch tag +archive -inbox +2017 path:${workmaildir}/INBOX.Archives.2017/'**'
notmuch tag +archive -inbox +2018 path:${workmaildir}/INBOX.Archives.2018/'**'
notmuch tag +archive -inbox +2019 path:${workmaildir}/INBOX.Archives.2019/'**'
notmuch tag +archive -inbox +2020 path:${workmaildir}/INBOX.Archives.2020/'**'
notmuch tag +archive -inbox +2021 path:${workmaildir}/INBOX.Archives.2021/'**'

notmuch tag +sent path:${workmaildir}/Sent/'**'

notmuch tag +draft path:${workmaildir}/Drafts/'**'