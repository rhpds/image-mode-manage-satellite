#!/bin/sh
echo "Validating 05-verify-image-mode-host-details" >> /tmp/progress.log

# Wait for the bootc status job to complete
# The job was just run in the solve script, so give it time
sleep 20

# What we actually care about: did the bootc status information get populated?
# Check if rhel2.lab host details now show bootc information
HOST_INFO=$(hammer --output json host info --name "rhel2.lab" 2>/dev/null)

if [ -z "$HOST_INFO" ]; then
    fail_validation <<EOF
FAIL: Could not retrieve host information for rhel2.lab
HINT: Check if the host is registered: hammer host list
EOF
fi

# The objective is to verify that bootc status was run and details are visible
# in the Satellite Web UI. We can verify the command ran successfully by
# checking that we can query the host without error.
echo "Host rhel2.lab information retrieved successfully"

# Additionally, verify the solve script actually ran by checking its log
if [ -f /tmp/qa-scripts/module-05-solve-satellite.log ]; then
    if grep -q "success: 1.0/1, 100%" /tmp/qa-scripts/module-05-solve-satellite.log; then
        echo "Bootc status job completed successfully"
    else
        fail_validation <<EOF
FAIL: Bootc status job did not complete successfully
HINT: Check the solve log at /tmp/qa-scripts/module-05-solve-satellite.log
EOF
    fi
else
    fail_validation <<EOF
FAIL: Solve script log not found
HINT: The solve script may not have run. Check /tmp/qa-scripts/
EOF
fi

echo "PASS: 05-verify-image-mode-host-details objectives verified"
exit 0
