# Module 07 — Push Container Image

### Brief Overview
This short module publishes the customized bootc image to Satellite's internal container registry. From the `rhel1` terminal, the learner logs in to the Satellite container registry with Podman and pushes the image built in the previous module. Once pushed, the image is available in the `bootc` product for rollout to the image mode host.

### Audience and Time
Intermediate administrators comfortable with Podman registry operations. Requires the tagged image built in Module 06. Estimated duration: 3 minutes.

### Learning Objectives
- Push the customized bootc container image to the Red Hat Satellite container registry using Podman.

### Lab Structure
| Section | Title | Duration |
|---------|-------|----------|
| 1 | Push the new container to Satellite's container registry | 3 min |

### Detailed Steps
1. On the `rhel1.lab` terminal, log in to the Satellite container registry:
   `podman login --tls-verify=false satellite.lab --username admin --password ...`.
2. Push the image:
   `podman push satellite.lab/acme_org/bootc/rhel-bootc:satellite-image-mode-lab --tls-verify=false`.
3. Confirm the push completes successfully.

### Key Takeaways
- Podman can authenticate to and push images to Satellite's internal container registry.
- Pushing the image makes it available in the `bootc` product for lifecycle management and rollout.

### Infrastructure Notes
Requires network access from `rhel1.lab` to the Satellite container registry (`satellite.lab`) and valid admin credentials. `--tls-verify=false` is used against the internal registry. A validate playbook can confirm the image is present in the `bootc` product.
