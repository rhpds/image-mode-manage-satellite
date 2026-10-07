#!/bin/sh
echo "Validating 02-create-container-repository" >> /tmp/progress.log

ORG="Acme Org"

# Check if the bootc product exists
if ! hammer product info --name "bootc" --organization "$ORG" >/dev/null 2>&1; then
    fail_validation <<EOF
FAIL: bootc product not found
HINT: Create it with: hammer product create --name "bootc" --organization "$ORG"
EOF
fi

echo "PASS: 02-create-container-repository objectives verified"
exit 0
