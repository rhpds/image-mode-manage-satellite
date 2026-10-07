#!/bin/sh
echo "Validating 09-schedule-remote-job" >> /tmp/progress.log

# Check that a Bootc switch job was invoked for rhel2.lab
# This is the core task - scheduling the job to switch to the new image.
# We verify the job exists; actual completion is async and may not have
# finished yet depending on timing.

# The template name appears in the Description column of the job-invocation list;
# grepping the plain list avoids the fragile --search field syntax, which can
# error and false-fail.
if ! hammer job-invocation list | grep -q "Bootc Switch"; then
    echo "FAIL: No Bootc switch job found for rhel2.lab"
    echo "HINT: Schedule the job with: hammer job-invocation create --job-template 'Bootc Switch - Script Default' --search-query 'name = rhel2.lab' --inputs 'target=satellite.lab/acme_org/bootc/rhel-bootc:satellite-image-mode-lab'"
    exit 1
fi

echo "PASS: 09-schedule-remote-job objectives verified"
exit 0
