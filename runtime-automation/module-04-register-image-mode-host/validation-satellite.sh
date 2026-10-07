#!/bin/sh
echo "Validating 04-register-image-mode-host" >> /tmp/progress.log

# Check that rhel2.lab is registered as a host in Satellite
if ! hammer host list | grep -q "rhel2.lab"; then
    echo "FAIL: Host 'rhel2.lab' not registered in Satellite"
    echo "HINT: Register the host using the generated registration command with activation key 'bootc'"
    exit 1
fi

echo "PASS: 04-register-image-mode-host objectives verified"
exit 0
