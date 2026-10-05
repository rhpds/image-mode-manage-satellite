#!/bin/sh
echo "Validating 05-verify-image-mode-host-details" >> /tmp/progress.log

# Wait a moment for the job to be registered in the database
sleep 10

# Get the most recent job invocation (regardless of search filters, just get latest)
JOB_ID=$(hammer --output json job-invocation list --order "id DESC" --per-page 1 2>/dev/null | jq -r '.[0].Id // empty')

if [ -z "$JOB_ID" ]; then
    # If no jobs at all, something is very wrong
    fail_validation <<EOF
FAIL: No job invocations found in Satellite
HINT: Check if the solve script ran successfully. Try: hammer job-invocation list
EOF
fi

echo "Found job invocation ID: $JOB_ID"

# Verify the job completed successfully
# Wait up to 60 seconds for job completion
for i in $(seq 1 60); do
    JOB_INFO=$(hammer --output json job-invocation info --id "$JOB_ID" 2>/dev/null)
    STATUS=$(echo "$JOB_INFO" | jq -r '.Status // empty')

    echo "Job status: $STATUS (attempt $i/60)"

    if [ "$STATUS" = "succeeded" ]; then
        echo "PASS: 05-verify-image-mode-host-details objectives verified"
        exit 0
    elif echo "$STATUS" | grep -qE "failed|cancelled"; then
        TEMPLATE=$(echo "$JOB_INFO" | jq -r '.["Job template"] // empty')
        fail_validation <<EOF
FAIL: Job invocation $JOB_ID failed with status: $STATUS
Job template: $TEMPLATE
HINT: Check job output with: hammer job-invocation output --id $JOB_ID
EOF
    fi
    sleep 1
done

# If we got here, the job didn't complete in time
fail_validation <<EOF
FAIL: Job invocation $JOB_ID did not complete within 60 seconds
Current status: $STATUS
HINT: Check job status with: hammer job-invocation info --id $JOB_ID
EOF
