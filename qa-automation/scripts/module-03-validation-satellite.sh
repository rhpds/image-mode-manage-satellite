#!/bin/sh
echo "Validating 03-create-activation-key" >> /tmp/progress.log

ORG="Acme Org"

# Check if the bootc activation key exists
if ! hammer activation-key info --name "bootc" --organization "$ORG" >/dev/null 2>&1; then
    fail_validation <<EOF
FAIL: bootc activation key not found
HINT: Create it with: hammer activation-key create --name "bootc" --organization "$ORG" --lifecycle-environment "Library" --content-view "Default Organization View"
EOF
fi

echo "PASS: 03-create-activation-key objectives verified"
exit 0
