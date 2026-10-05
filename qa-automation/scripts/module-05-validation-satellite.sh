#!/bin/sh
echo "Validating 05-verify-image-mode-host-details" >> /tmp/progress.log

# Wait a moment for the job to be registered in the database
sleep 10

# Check if a Bootc status job was created for rhel2.lab
# Look for the most recent job invocation on rhel2.lab
JOB_ID=$(hammer --output json job-invocation list --search "host = rhel2.lab" --order "id DESC" --per-page 1 | jq -r '.[0].Id // empty')

if [ -z "$JOB_ID" ]; then
    fail_validation <<EOF
FAIL: No job invocation found for rhel2.lab
HINT: Run a Bootc status job with: hammer job-invocation create --job-template 'Bootc Action - Script Default' --search-query 'name = rhel2.lab' --inputs 'action=status'
EOF
fi

# Verify the job completed successfully
# Wait up to 60 seconds for job completion
for i in $(seq 1 60); do
    STATUS=$(hammer --output json job-invocation info --id "$JOB_ID" 2>/dev/null | jq -r '.Status // empty')

    if [ "$STATUS" = "succeeded" ]; then
        echo "PASS: 05-verify-image-mode-host-details objectives verified"
        exit 0
    elif echo "$STATUS" | grep -qE "failed|cancelled"; then
        fail_validation <<EOF
FAIL: Bootc status job failed with status: $STATUS
HINT: Check job output with: hammer job-invocation output --id $JOB_ID
EOF
    fi
    sleep 1
done

# If we got here, the job didn't complete in time
fail_validation <<EOF
FAIL: Bootc status job did not complete within 60 seconds
HINT: Check job status with: hammer job-invocation info --id $JOB_ID
EOF
