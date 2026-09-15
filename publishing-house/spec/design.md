# Manage RHEL Image Mode Hosts with Red Hat Satellite

## Overview

This hands-on lab shows how Red Hat Satellite manages RHEL 10 image mode (bootc) hosts across their full lifecycle, from initial registration through delivering a customized container image update. Image mode packages the operating system as a bootable container, and Satellite provides the container registry, host registration, and remote execution needed to operate these hosts at scale.

Participants configure a container repository and activation key in Satellite, register a RHEL 10 image mode host, and verify its booted container image details. They then build a customized bootc image with Podman on a build host, push it to the Satellite container registry, locate its published image label, and schedule a Satellite remote job that switches the managed host to the new image and reboots into it.

## Target Audience

- **Role:** Systems administrators and platform engineers who manage RHEL fleets with Red Hat Satellite.
- **Experience level:** Intermediate.
- **What they already know:** Satellite Web UI navigation, basic Linux and SSH, and container concepts (Containerfile, image tags, registries, Podman).
- **What they don't know:** How RHEL image mode (bootc) hosts are registered, tracked, and updated through Red Hat Satellite; how to build and publish a bootc image to the Satellite container registry; how to drive image switches with Satellite remote execution.

## Prerequisites

- Familiarity with the Red Hat Satellite Web UI (navigating Content, Activation Keys, and Hosts).
- Basic Linux command line and SSH usage.
- Understanding of container fundamentals: Containerfiles, image tags, registries, and Podman.
- Introductory knowledge of RHEL image mode / bootc concepts.
- Prerequisites are assumed knowledge, not gated by automation. The lab environment is pre-provisioned (Satellite server and two RHEL 10 hosts), so no learner-side setup is validated before starting. (Automated validation: No.)

## Learning Objectives

1. Configure Red Hat Satellite with a container repository and an activation key to support image mode hosts.
2. Register a RHEL image mode host to Red Hat Satellite and verify its booted container image details.
3. Build and push a customized bootc container image to the Satellite container registry using Podman.
4. Manage an image mode host update by scheduling a Satellite remote job that switches and reboots the host into the new container image.

## Content Type

Lab (hands-on)

## Products & Technologies

- Red Hat Satellite 6.19
- Red Hat Enterprise Linux 10
- RHEL image mode / bootc (bootc CLI, `registry.redhat.io/rhel10/rhel-bootc:10.1` base image)
- Podman (build, login, push)
- Red Hat Satellite `hammer` CLI
- Red Hat Container Registry (`registry.redhat.io`)
- Red Hat Insights (referenced; explicitly disabled during host registration)

## Module Map

| Module | Title | Duration |
|--------|-------|----------|
| 1 | Introduction | 5 min |
| 2 | Create Container Repository | 3 min |
| 3 | Create Activation Key | 4 min |
| 4 | Register Image Mode Host | 5 min |
| 5 | Verify Image Mode Host Details | 5 min |
| 6 | Update Container Image | 6 min |
| 7 | Push Container Image | 3 min |
| 8 | Obtain Container Image Label | 3 min |
| 9 | Schedule Remote Job | 8 min |
| — | **Total hands-on** | **~37 min** |
| — | Intro / orientation | ~5 min |
| — | **Total lab** | **~42 min** |

## Difficulty Level

Intermediate

## Environment

**Learner view:** When the lab starts, three pre-provisioned hosts are available through wetty SSH terminals and a Satellite Web UI tab:

- `satellite.lab` — a pre-installed Red Hat Satellite 6.19 server with admin credentials provided; Satellite installation is out of scope.
- `rhel1.lab` — a RHEL 10 build host with the `rhel10/rhel-bootc:10.1` base image pre-pulled, used to build and push the customized container image.
- `rhel2.lab` — a RHEL 10 image mode host that the learner registers to Satellite and later updates.

The lab pre-caches the `registry.redhat.io` content needed so learners do not have to authenticate to the external registry; Satellite's own container registry (`satellite.lab`) is internal to the environment. Navigation is driven by the Nookbag guided UI (Zero-Touch).

**Automation needed:** Yes.

Automation must provision the three VMs, pre-install and configure the Satellite 6.19 server (organization, lifecycle environments, Bootc job templates for "Bootc Status" and "Bootc Switch", remote execution), pre-pull the `rhel10/rhel-bootc:10.1` image on `rhel1.lab`, and pre-cache the required `registry.redhat.io` content. Per-module solve/validate playbooks support the guided experience.

## Infrastructure Requirements

- **Cloud provider:** TBD — confirmed in infrastructure phase (default CNV).
- **Cluster type:** Not applicable — this is a RHEL VM-based lab, not OpenShift.
- **OCP version:** Not applicable.
- **Topology:** Per-student — each learner receives an isolated set of `satellite.lab`, `rhel1.lab`, and `rhel2.lab`.
- **Sizing:** Best-estimate, refined in infrastructure phase — `satellite.lab` (4 CPU, 20 GB RAM, 200 GB disk), `rhel1.lab` (2 CPU, 4 GB RAM, 50 GB disk), `rhel2.lab` (2 CPU, 4 GB RAM, 50 GB disk). All RHEL 10.
- **Automation approach:** Ansible.
- **AI/MaaS:** None.
- **External services:** `registry.redhat.io` (pre-cached in the lab environment; required externally otherwise).
- **AAP version:** Not applicable (no AAP).
- **Non-GA products:** None (all products are GA). TBD — confirmed in infrastructure phase.

## Assessment Strategy (Optional)

This is a Zero-Touch guided lab, so each module is supported by per-module solve and validate playbooks:

- **Validate** playbooks confirm objectives are met — for example, that the `bootc` container repository/product and activation key exist in Satellite, that `rhel2.lab` is registered, that the customized image was pushed to the Satellite container registry, and that `rhel2.lab` has switched to and booted the new image (verified via `bootc status` and the presence of the custom MOTD).
- **Solve** playbooks perform or reveal the intended actions so a learner can catch up if a step is missed.

Several steps also surface visible results directly in the Satellite Web UI (booted container images, image mode details card, remote job status) and on the host terminals, which serve as in-line confirmation of success.
