# Module 06 — Update Container Image

### Brief Overview
This module builds a customized bootc container image on the build host `rhel1`. The learner writes a Containerfile based on the official `registry.redhat.io/rhel10/rhel-bootc:10.1` image that adds a custom message-of-the-day (MOTD), then builds and tags the image with Podman for the Satellite container registry. This produces the updated image that will later be pushed and rolled out to `rhel2`.

### Audience and Time
Intermediate administrators comfortable with Containerfiles and Podman builds. Requires terminal access to `rhel1.lab`. Estimated duration: 6 minutes.

### Learning Objectives
- Build a customized bootc container image from the `rhel10/rhel-bootc:10.1` base image using Podman.

### Lab Structure
| Section | Title | Duration |
|---------|-------|----------|
| 1 | Update the container image | 6 min |

### Detailed Steps
1. On the `rhel1.lab` terminal, create a Containerfile:
   `cat <<'EOT' > Containerfile ...` based on `registry.redhat.io/rhel10/rhel-bootc:10.1` that modifies `/etc/motd`.
2. (Non-lab users only) Authenticate to the base image registry: `podman login registry.redhat.io`.
3. Build and tag the image:
   `podman build -f Containerfile -t satellite.lab/acme_org/bootc/rhel-bootc:satellite-image-mode-lab`.
4. Confirm the build completes and the tagged image is present (`podman images`).

### Key Takeaways
- A bootc image can be customized by layering changes (like a custom MOTD) on the official base image.
- Podman builds and tags the image for the target Satellite container registry namespace.
- In the lab the base image is pre-pulled; externally it requires `registry.redhat.io` authentication.

### Infrastructure Notes
Requires the `rhel10/rhel-bootc:10.1` base image pre-pulled on `rhel1.lab` and Podman installed. The `registry.redhat.io` external service is pre-cached in the lab. A validate playbook can confirm the tagged image exists on `rhel1`.
