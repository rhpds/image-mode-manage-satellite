#!/bin/sh
echo "Validating 08-obtain-container-image-label" >> /tmp/progress.log

# Check if the bootc product's repository is visible and contains content
if ! hammer repository list --product "bootc" --organization "Acme Org" 2>/dev/null | grep -q "acme_org-bootc-rhel_bootc"; then
    fail_validation <<EOF
FAIL: bootc product repository not found
HINT: Ensure the container image was pushed to create the repository automatically
EOF
fi

echo "PASS: 08-obtain-container-image-label objectives verified"
exit 0
