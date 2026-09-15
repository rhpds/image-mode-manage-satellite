# Module 05 — Verify Image Mode Host Details

### Brief Overview
This module explores the image mode data Satellite collects about a registered host. The learner views the booted container images for `rhel2.lab`, runs the "Bootc Status" remote job to refresh that data on demand, and inspects the host's Image mode details card, including the currently running image. It highlights that image mode data refreshes after the job runs or automatically about every four hours.

### Audience and Time
Intermediate administrators familiar with the Satellite Hosts view and remote execution. Requires `rhel2` registered from Module 04. Estimated duration: 5 minutes.

### Learning Objectives
- Verify the booted container image and image mode details for `rhel2.lab` in Red Hat Satellite.
- Monitor image mode host status by running the "Bootc Status" remote job to refresh Satellite's data.

### Lab Structure
| Section | Title | Duration |
|---------|-------|----------|
| 1 | View booted container images | 2 min |
| 2 | Update the container image status | 2 min |
| 3 | View image mode details | 1 min |

### Detailed Steps
1. In the Satellite Web UI, open the `rhel2.lab` host details and view its booted container images.
2. Schedule the "Bootc Status - Script Default" remote job against `rhel2.lab`.
3. Wait for the remote job to complete successfully.
4. Return to the host's Image mode details card and view the running image.
5. Note that image mode data refreshes after the job runs or roughly every 4 hours.

### Key Takeaways
- Satellite tracks booted container images and image mode details for registered hosts.
- The "Bootc Status" remote job refreshes image mode data on demand.
- Image mode data also refreshes automatically about every four hours.

### Infrastructure Notes
Requires Satellite remote execution configured and the "Bootc Status" job template available. Web UI-driven with an underlying remote job. A validate playbook can confirm the remote job completed and image mode details are populated.
