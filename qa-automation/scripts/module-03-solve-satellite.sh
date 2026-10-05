#!/bin/sh
echo "Solving 03-create-activation-key" >> /tmp/progress.log

ORG="Acme Org"

# Check if bootc activation key already exists
if hammer activation-key info --name "bootc" --organization "$ORG" >/dev/null 2>&1; then
    echo "bootc activation key already exists, skipping creation"
else
    # Create an activation key that grants our image mode host access to
    # the Default Organization View content view.
    hammer activation-key create \
      --name "bootc" \
      --organization "$ORG" \
      --lifecycle-environment "Library" \
      --content-view "Default Organization View"
    echo "bootc activation key created"
fi

echo "Solved 03-create-activation-key" >> /tmp/progress.log
