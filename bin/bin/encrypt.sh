#!/bin/sh

usage() {
echo """Usage: $(basename $0) [INPUT] [OUTPUT]

Creates a self decrypting blob of data. 
Data is decrypted when blob is executed."""
exit
}

while true; do
  read -s -p "PASSWORD 1: " PASSWORD_1
  echo
  read -s -p "PASSWORD 2: " PASSWORD_2
  echo
  [ "$PASSWORD_1" = "$PASSWORD_2" ] && break
  echo "Please try again"
done

INPUT="$1"
OUTPUT="$2"
MESSAGE="$3"

# more than 1, less than 4, 2 or 3
[ $# -gt 1 ] && [ $# -lt 4 ] || usage 

# file must exist
[ -f "$INPUT" ] || usage 

# delete output if it exists
[ -f "$OUTPUT" ] && rm "$OUTPUT"

# generate the base64 cyphertext
echo "Encrypting..."
CYPHER=$(openssl enc    \
        -aes-256-cbc    \
        -pass "pass:$PASSWORD_1"  \
        -iter 500000    \
        -in "$INPUT"    \
        -a              \
        -out - )

# Write payload + decryptor
echo "#!/bin/sh -e" >> "$OUTPUT"
echo "FILENAME=\"$(basename $INPUT)\"" >> "$OUTPUT"
echo "DATE=\"$(date)\"" >> "$OUTPUT"
echo "MESSAGE=\"$MESSAGE\"" >> "$OUTPUT"
echo "CHECKSUM=\"$(sha1sum "$INPUT" | cut -d' ' -f1)\"" >> "$OUTPUT"
echo ">&2 echo \"FILENAME: \$FILENAME\"" >> "$OUTPUT"
echo ">&2 echo \"DATE: \$DATE\"" >> "$OUTPUT"
echo ">&2 echo \"MESSAGE: \$MESSAGE\"" >> "$OUTPUT"
echo ">&2 read -sp 'PASSWORD: ' PASSWORD && >&2 echo ''" >> "$OUTPUT"
echo "DATA=\"
$CYPHER
\"" >> "$OUTPUT"
echo ">&2 echo 'Decrypting...'" >> "$OUTPUT"
echo "rm -f \"/tmp/\$FILENAME\"" >> "$OUTPUT"
echo "openssl enc \\
        -aes-256-cbc \\
        -pass \"pass:\$PASSWORD\" \\
        -iter 500000 \\
        -d \\
        -a \\
        -in - <<< \"\$DATA\" > \"/tmp/\$FILENAME\"" >> "$OUTPUT"
#echo "echo \"\$PLAIN\" > CHECKSUM" >> "$OUTPUT"
echo "sha1sum -c <(echo \"\$CHECKSUM /tmp/\$FILENAME\" ) | >&2 sed 's/^.*:/CHECKSUM:/' " >> "$OUTPUT"
echo "cat \"/tmp/\$FILENAME\"" >> "$OUTPUT"
chmod +x "$2"
