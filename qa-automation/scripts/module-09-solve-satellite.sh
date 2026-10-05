#!/bin/sh
echo "Solving 09-schedule-remote-job" >> /tmp/progress.log

# Schedule a Bootc switch job to point rhel2 at the newly published
# container image.
hammer job-invocation create \
  --job-template "Bootc Switch - Script Default" \
  --search-query "name = rhel2.lab" \
  --inputs "target=satellite.lab/acme_org/bootc/rhel-bootc:satellite-image-mode-lab"

# Reboot rhel2 into the new image
ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null root@rhel2 reboot || true

# Wait for system to go down
sleep 10

# Wait for system to come back up (up to 90 seconds)
echo "Waiting for rhel2 to reboot..."
for i in $(seq 1 90); do
    if ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o ConnectTimeout=5 root@rhel2 "echo ready" >/dev/null 2>&1; then
        echo "rhel2 is back online"
        break
    fi
    sleep 1
done

# Give bootc a moment to initialize, then check status
sleep 5
ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null root@rhel2 bootc status || true

echo "Solved 09-schedule-remote-job" >> /tmp/progress.log
