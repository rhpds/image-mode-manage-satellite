#!/bin/sh
echo "Validating 07-push-container-image" >> /tmp/progress.log

ORG="Acme Org"

# Pushing the image auto-creates a repository under the bootc product. Before the
# push the product has no repositories, so the presence of the rhel-bootc repo is
# the core signal that the push landed. (The tag 'satellite-image-mode-lab' is a
# tag, not a repository name, so it does not appear in 'repository list' output.)
if ! hammer repository list --product "bootc" --organization "$ORG" | grep -q "rhel-bootc"; then
    echo "FAIL: No 'rhel-bootc' repository found under the bootc product (image not pushed)"
    echo "HINT: From rhel1, log in and push: podman push satellite.lab/acme_org/bootc/rhel-bootc:satellite-image-mode-lab --tls-verify=false"
    exit 1
fi

echo "PASS: 07-push-container-image objectives verified"
exit 0
