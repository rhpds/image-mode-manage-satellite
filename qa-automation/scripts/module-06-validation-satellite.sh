#!/bin/sh
echo "Validating 06-update-container-image" >> /tmp/progress.log

# Check if the updated container image was built on rhel1
if ! ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null root@rhel1 "podman images | grep -q 'satellite.lab/acme_org/bootc/rhel-bootc.*satellite-image-mode-lab'" 2>/dev/null; then
    fail_validation <<EOF
FAIL: Updated container image not found on rhel1
HINT: Build the image on rhel1 with: podman build -f Containerfile -t satellite.lab/acme_org/bootc/rhel-bootc:satellite-image-mode-lab
EOF
fi

echo "PASS: 06-update-container-image objectives verified"
exit 0
