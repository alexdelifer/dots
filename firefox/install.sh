NIGHTLY=~/.mozilla/firefox/*.default-nightly
STABLE=~/.mozilla/firefox/*.default

FFOX=($STABLE $NIGHTLY)
#pwd

# Create the chrome directory and stow userchrome.css there.

for i in ${FFOX[*]}; do
	#echo "$i"
	mkdir -p "$i/chrome"
	stow -t "$i/chrome" -d "firefox/.mozilla" "firefox" 

done
