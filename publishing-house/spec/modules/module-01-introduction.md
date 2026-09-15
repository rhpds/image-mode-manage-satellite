# Module 01 — Introduction

### Brief Overview
This module introduces RHEL image mode (bootc), where the operating system is delivered and managed as a bootable container image, and previews how Red Hat Satellite manages these hosts. It describes the lab environment — a pre-installed Satellite server plus two RHEL 10 hosts — and orients the learner to the tasks ahead. The learner finishes by logging into the Satellite Web UI with the provided admin credentials.

### Audience and Time
Intermediate systems administrators and platform engineers familiar with Satellite navigation and container basics. No prior module required. Estimated duration: 5 minutes.

### Learning Objectives
- Explore the image mode (bootc) concept and how Red Hat Satellite fits into managing image mode hosts.
- Verify access to the Satellite Web UI by logging in with the provided admin credentials.

### Lab Structure
| Section | Title | Duration |
|---------|-------|----------|
| 1 | Image Mode | 2 min |
| 2 | Lab Environment | 1 min |
| 3 | Log into the Web UI | 2 min |

### Detailed Steps
1. Read the overview of image mode / bootc and how it differs from package (RPM) mode.
2. Review the lab environment: `satellite.lab` (Satellite 6.19 server), `rhel1.lab` (RHEL 10 build host), and `rhel2.lab` (RHEL 10 image mode host).
3. Copy the provided admin credentials.
4. Open the Satellite Web UI tab and log in.
5. Confirm the Satellite dashboard loads successfully.

### Key Takeaways
- Image mode packages the OS as a bootable container image managed with bootc.
- Red Hat Satellite provides the registry, registration, and remote execution to manage image mode hosts.
- The lab uses one Satellite server and two RHEL 10 hosts.

### Infrastructure Notes
Requires the Satellite Web UI reachable via the guided UI tab and valid admin credentials surfaced to the learner. No terminal actions in this module.
