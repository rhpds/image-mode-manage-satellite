#!/bin/sh
echo "Validating 07-push-container-image" >> /tmp/progress.log

# Check if the container image was pushed to Satellite's registry
# We verify by checking if the repository exists and has content
if ! hammer repository list --product "bootc" --organization "Acme Org" | grep "Acme_Org_bootc_rhel-bootc"; then
    fail_validation <<EOF
FAIL: Container image repository not found in Satellite
HINT: Push the image from rhel1: podman push satellite.lab/acme_org/bootc/rhel-bootc:satellite-image-mode-lab --tls-verify=false
EOF
fi

echo "PASS: 07-push-container-image objectives verified"
exit 0
