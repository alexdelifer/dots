#unmailboxes *

set from = "alex.delifer@zimmerbiomet.com"
set sendmail = "~/.config/neomutt/scripts/send-mail.sh zimmerbiomet"
set folder = "~/Mail/alex.delifer@zimmerbiomet.com/"
set spoolfile = "+INBOX"
set postponed = "+Drafts"
set record = "+Sent"
set trash = "+Junk"

alias me "Alex Delifer" "alex.delifer@zimmerbiomet.com"

set mbox_type = Maildir
set ssl_starttls = yes
set ssl_force_tls = yes

#mailboxes =INBOX =Sent =Drafts =Junk
