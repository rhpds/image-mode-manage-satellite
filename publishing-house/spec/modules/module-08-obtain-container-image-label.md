# Module 08 — Obtain Container Image Label

### Brief Overview
This module locates the published image label needed to target the customized image in the final rollout step. In the Satellite Web UI, the learner navigates to the `bootc` product's container image tags and lifecycle environments to find the image label `satellite.lab/acme_org/bootc/rhel-bootc:satellite-image-mode-lab` and its "Published At" value. This information is used to configure the remote job in the next module.

### Audience and Time
Intermediate administrators familiar with Satellite Content and lifecycle environments. Requires the image pushed in Module 07. Estimated duration: 3 minutes.

### Learning Objectives
- Verify the published container image label and "Published At" value for the customized bootc image in Satellite.

### Lab Structure
| Section | Title | Duration |
|---------|-------|----------|
| 1 | Obtain the container image label | 3 min |

### Detailed Steps
1. In the Satellite Web UI, navigate to Content > Products and open the `bootc` product.
2. View the Container Image Tags for the product.
3. Review the lifecycle environments to find the published image.
4. Record the image label `satellite.lab/acme_org/bootc/rhel-bootc:satellite-image-mode-lab` and the "Published At" value.

### Key Takeaways
- Satellite exposes container image tags and lifecycle environment publish details per product.
- The image label and "Published At" value identify the exact image to target for a host update.

### Infrastructure Notes
Web UI navigation only; no CLI. Depends on the image successfully pushed in Module 07. No validation playbook strictly required, though the recorded label feeds Module 09.
