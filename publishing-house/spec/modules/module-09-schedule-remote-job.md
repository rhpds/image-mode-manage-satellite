# Module 09 — Schedule Remote Job

### Brief Overview
This capstone module rolls out the customized image to the image mode host by combining the Satellite UI and the host CLI. The learner schedules a "Bootc Switch" remote job in Satellite targeting `rhel2` with the new image label, then verifies on the `rhel2` terminal that the image is staged with `bootc status`, reboots into it, and confirms the new image and custom MOTD are active with rollback available.

### Audience and Time
Intermediate administrators comfortable with Satellite remote execution and the bootc CLI. Requires the image label recorded in Module 08. Estimated duration: 8 minutes.

### Learning Objectives
- Manage an image mode host update by scheduling a "Bootc Switch" remote job in Satellite targeting `rhel2`.
- Verify the staged image with `bootc status`, reboot into it, and confirm the new image and custom MOTD are active.

### Lab Structure
| Section | Title | Duration |
|---------|-------|----------|
| 1 | Initiate an update | 3 min |
| 2 | Check the status | 2 min |
| 3 | Reboot into the new container image | 3 min |

### Detailed Steps
1. In the Satellite Web UI, schedule the "Bootc Switch" remote job targeting `rhel2` with the new image label from Module 08.
2. Wait for the remote job to complete successfully.
3. On the `rhel2.lab` terminal, run `bootc status` and confirm the new image is staged.
4. Reboot the host: `reboot`.
5. Reconnect to `rhel2.lab` and confirm the custom MOTD is displayed.
6. Run `bootc status` again to confirm the new image is booted and rollback to the previous image is available.

### Key Takeaways
- The "Bootc Switch" remote job stages a new image on an image mode host from Satellite.
- `bootc status` shows staged, booted, and rollback images.
- Rebooting activates the new image; image mode keeps the prior image available for rollback.

### Infrastructure Notes
Requires Satellite remote execution with the "Bootc Switch" job template and terminal access to `rhel2.lab`. Combines UI and CLI. A validate playbook can confirm `rhel2` booted the new image (custom MOTD present, `bootc status` shows the expected image).
