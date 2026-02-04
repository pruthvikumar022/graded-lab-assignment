#!/bin/bash

# Extract valid emails
grep -E '^[a-zA-Z0-9]+@[a-zA-Z]+\.com$' emails.txt > valid_temp.txt

# Remove duplicates from valid emails
sort valid_temp.txt | uniq > valid.txt

# Extract invalid emails
grep -v -E '^[a-zA-Z0-9]+@[a-zA-Z]+\.com$' emails.txt > invalid.txt

# Clean up temporary file
rm valid_temp.txt

echo "Valid and invalid email extraction completed."
