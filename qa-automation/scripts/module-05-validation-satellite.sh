#!/bin/sh
echo "Validating 05-verify-image-mode-host-details" >> /tmp/progress.log

# Wait a moment for the job to be registered in the database
sleep 5

# Check if a Bootc status job was created for rhel2.lab
# Look for recent job invocations with the Bootc Action template
if ! hammer job-invocation list --search "job_template = \"Bootc Action - Script Default\" and targeting.search = \"name = rhel2.lab\"" --per-page 1 | grep -q "Bootc Action"; then
    fail_validation <<EOF
FAIL: No Bootc status job found for rhel2.lab
HINT: Run a Bootc status job with: hammer job-invocation create --job-template 'Bootc Action - Script Default' --search-query 'name = rhel2.lab' --inputs 'action=status'
EOF
fi

# Verify the job completed successfully
JOB_ID=$(hammer --output json job-invocation list --search "job_template = \"Bootc Action - Script Default\" and targeting.search = \"name = rhel2.lab\"" --per-page 1 | jq -r '.[0].Id // empty')

if [ -n "$JOB_ID" ]; then
    # Wait up to 30 seconds for job completion
    for i in $(seq 1 30); do
        STATUS=$(hammer --output json job-invocation info --id "$JOB_ID" | jq -r '.Status // empty')
        if [ "$STATUS" = "succeeded" ]; then
            break
        elif echo "$STATUS" | grep -qE "failed|cancelled"; then
            fail_validation <<EOF
FAIL: Bootc status job failed with status: $STATUS
HINT: Check job output with: hammer job-invocation output --id $JOB_ID
EOF
        fi
        sleep 1
    done
fi

echo "PASS: 05-verify-image-mode-host-details objectives verified"
exit 0
