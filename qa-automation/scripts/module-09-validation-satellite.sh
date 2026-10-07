#!/bin/sh
echo "Validating 09-schedule-remote-job" >> /tmp/progress.log

# Wait a moment for the job to be registered and system to reboot
sleep 15

# Check if a Bootc switch job was created for rhel2.lab by finding recent jobs
# Look for "bootc switch" in the Description field (note: lowercase "bootc")
JOB_ID=$(hammer --output json job-invocation list --search "host = rhel2.lab" --order "id DESC" --per-page 5 2>/dev/null | jq -r '.[] | select(.Description | contains("bootc switch")) | .ID' | head -1)

if [ -z "$JOB_ID" ]; then
    fail_validation <<EOF
FAIL: No Bootc job found for rhel2.lab
HINT: Run the switch job with: hammer job-invocation create --job-template "Bootc Switch - Script Default" --search-query "name = rhel2.lab" --inputs "target=satellite.lab/acme_org/bootc/rhel-bootc:satellite-image-mode-lab"
EOF
fi

# Wait for rhel2 to be accessible after reboot (up to 90 seconds)
echo "Waiting for rhel2 to come back online after reboot..."
for i in $(seq 1 90); do
    if ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o ConnectTimeout=5 root@rhel2 "echo connected" >/dev/null 2>&1; then
        echo "rhel2 is accessible"
        break
    fi
    if [ $i -eq 90 ]; then
        fail_validation <<EOF
FAIL: rhel2 is not accessible after 90 seconds
HINT: The system may still be rebooting. Check manually with: ssh root@rhel2
EOF
    fi
    sleep 1
done

# Give bootc a moment to fully initialize
sleep 5

# Verify bootc status shows the new image
if ! ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null root@rhel2 "bootc status 2>/dev/null | grep -q 'satellite.lab/acme_org/bootc/rhel-bootc'"; then
    # Try to get actual bootc status for debugging
    ACTUAL_STATUS=$(ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null root@rhel2 "bootc status 2>&1" || echo "Could not get bootc status")
    fail_validation <<EOF
FAIL: rhel2 is not running the expected bootc image
Current bootc status: $ACTUAL_STATUS
HINT: Check bootc status with: ssh root@rhel2 bootc status
EOF
fi

echo "PASS: 09-schedule-remote-job objectives verified"
exit 0
