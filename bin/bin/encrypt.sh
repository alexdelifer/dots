#!/bin/sh

INPUT="$1"
OUTPUT="$2"

CYPHER=$(openssl enc \
        -aes-256-cbc \
        -iter 500000 \
        -in "$INPUT" \
        -a           \
        -out - )

# Write payload + decryptor
echo "#!/bin/sh" >> "$OUTPUT"
echo "DATA=\"$CYPHER\"" >> "$OUTPUT"
echo "openssl enc \\
        -aes-256-cbc \\
        -iter 500000 \\
        -d \\
        -a \\
        -in - <<< \"\$DATA\"" >> "$OUTPUT"

chmod +x "$2"
