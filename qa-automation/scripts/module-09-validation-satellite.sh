#!/bin/sh
echo "Validating 09-schedule-remote-job" >> /tmp/progress.log

# Check if a Bootc switch job was created for rhel2.lab
if ! hammer job-invocation list --search "job_template = \"Bootc Switch - Script Default\" and targeting.search = \"name = rhel2.lab\"" --per-page 1 | grep -q "Bootc Switch"; then
    fail_validation <<EOF
FAIL: No Bootc switch job found for rhel2.lab
HINT: Run the switch job with: hammer job-invocation create --job-template "Bootc Switch - Script Default" --search-query "name = rhel2.lab" --inputs "target=satellite.lab/acme_org/bootc/rhel-bootc:satellite-image-mode-lab"
EOF
fi

# Verify rhel2 is accessible after reboot
if ! ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o ConnectTimeout=5 root@rhel2 "echo connected" >/dev/null 2>&1; then
    fail_validation <<EOF
FAIL: rhel2 is not accessible after reboot
HINT: The system may still be rebooting. Wait and verify with: ssh root@rhel2 bootc status
EOF
fi

# Verify bootc status shows the new image
if ! ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null root@rhel2 "bootc status 2>/dev/null | grep -q 'satellite.lab/acme_org/bootc/rhel-bootc'"; then
    fail_validation <<EOF
FAIL: rhel2 is not running the expected bootc image
HINT: Check bootc status with: ssh root@rhel2 bootc status
EOF
fi

echo "PASS: 09-schedule-remote-job objectives verified"
exit 0
