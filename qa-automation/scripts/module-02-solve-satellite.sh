#!/bin/sh
echo "Solving 02-create-container-repository" >> /tmp/progress.log

ORG="Acme Org"

# Check if bootc product already exists
if hammer product info --name "bootc" --organization "$ORG" >/dev/null 2>&1; then
    echo "bootc product already exists, skipping creation"
else
    # Create the bootc product that will provide a method for storing
    # image mode container images.
    hammer product create \
      --name "bootc" \
      --organization "$ORG"
    echo "bootc product created"
fi

echo "Solved 02-create-container-repository" >> /tmp/progress.log
