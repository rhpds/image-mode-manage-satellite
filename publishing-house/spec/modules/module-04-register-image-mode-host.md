# Module 04 — Register Image Mode Host

### Brief Overview
This module registers the image mode host `rhel2` to Red Hat Satellite. On the Satellite server terminal, the learner uses the `hammer` CLI to generate a host registration command scoped to the `bootc` activation key, then runs that command against `rhel2` over SSH. This is the first terminal/CLI-based module and brings `rhel2` under Satellite management (with Red Hat Insights setup explicitly disabled).

### Audience and Time
Intermediate administrators comfortable with SSH and the Satellite `hammer` CLI. Requires the `bootc` activation key from Module 03. Estimated duration: 5 minutes.

### Learning Objectives
- Register the RHEL image mode host `rhel2` to Red Hat Satellite using a `hammer`-generated registration command.

### Lab Structure
| Section | Title | Duration |
|---------|-------|----------|
| 1 | Register the image mode host rhel2 to Satellite | 5 min |

### Detailed Steps
1. On the `satellite.lab` terminal, generate the registration command:
   `hammer host-registration generate-command --activation-key bootc ...` (with Insights setup disabled).
2. Capture the generated registration script into a variable (`regscript`).
3. Run the registration command against `rhel2` over SSH: `ssh ... root@rhel2 $regscript`.
4. Wait for the registration to complete.
5. In the Satellite Web UI, navigate to Hosts and confirm `rhel2.lab` appears as a registered host.

### Key Takeaways
- `hammer host-registration generate-command` produces a ready-to-run registration script tied to an activation key.
- Registration can be executed remotely over SSH to bring a host under Satellite management.
- Red Hat Insights setup can be disabled during registration when not required.

### Infrastructure Notes
Requires terminal access to `satellite.lab` and SSH connectivity from Satellite to `rhel2.lab`. First CLI module. A validate playbook can confirm `rhel2` is registered in Satellite.
