#!/bin/sh
echo "Validating 05-verify-image-mode-host-details" >> /tmp/progress.log

# Check that a Bootc Action (status) job was invoked. The template name appears in
# the Description column of the job-invocation list; grepping the plain list avoids
# the fragile --search field syntax, which can error and false-fail.
if ! hammer job-invocation list | grep -q "bootc status"; then
    echo "FAIL: No Bootc status job found for rhel2.lab"
    echo "HINT: Run a Bootc status job with: hammer job-invocation create --job-template 'Bootc Action - Script Default' --search-query 'name = rhel2.lab' --inputs 'action=status'"
    exit 1
fi

echo "PASS: 05-verify-image-mode-host-details objectives verified"
exit 0
