#!/bin/sh
echo "Validating 03-create-activation-key" >> /tmp/progress.log

ORG="Acme Org"

# Check that the bootc activation key exists
if ! hammer activation-key list --organization "$ORG" | grep -q "bootc"; then
    echo "FAIL: Activation key 'bootc' not found in organization '$ORG'"
    echo "HINT: Create the activation key with: hammer activation-key create --name 'bootc' --organization '$ORG' --lifecycle-environment 'Library' --content-view 'Default Organization View'"
    exit 1
fi

echo "PASS: 03-create-activation-key objectives verified"
exit 0
