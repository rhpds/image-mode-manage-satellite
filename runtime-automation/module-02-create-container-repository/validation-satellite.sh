#!/bin/sh
echo "Validating 02-create-container-repository" >> /tmp/progress.log

ORG="Acme Org"

# Check that the bootc product exists
if ! hammer product list --organization "$ORG" | grep -q "bootc"; then
    echo "FAIL: Product 'bootc' not found in organization '$ORG'"
    echo "HINT: Create the product with: hammer product create --name 'bootc' --organization '$ORG'"
    exit 1
fi

echo "PASS: 02-create-container-repository objectives verified"
exit 0
