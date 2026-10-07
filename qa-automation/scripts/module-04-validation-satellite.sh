#!/bin/sh
echo "Validating 04-register-image-mode-host" >> /tmp/progress.log

# Check if rhel2.lab is registered in Satellite
if ! hammer host info --name "rhel2.lab" >/dev/null 2>&1; then
    fail_validation <<EOF
FAIL: rhel2.lab host not registered in Satellite
HINT: Register the host using the registration script with the bootc activation key
EOF
fi

echo "PASS: 04-register-image-mode-host objectives verified"
exit 0
