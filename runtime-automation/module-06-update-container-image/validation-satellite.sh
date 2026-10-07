#!/bin/sh
echo "Validating 06-update-container-image" >> /tmp/progress.log

# Check that the container image exists on rhel1
if ! ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null root@rhel1 podman image exists satellite.lab/acme_org/bootc/rhel-bootc:satellite-image-mode-lab; then
    echo "FAIL: Container image 'satellite.lab/acme_org/bootc/rhel-bootc:satellite-image-mode-lab' not found on rhel1"
    echo "HINT: Build the image on rhel1 with: podman build -f Containerfile -t satellite.lab/acme_org/bootc/rhel-bootc:satellite-image-mode-lab"
    exit 1
fi

echo "PASS: 06-update-container-image objectives verified"
exit 0
