# Module 03 — Create Activation Key

### Brief Overview
This module creates a Satellite activation key that will be used to register the image mode host. In the Satellite Web UI, the learner creates an activation key named `bootc` and assigns it the Library / Default Organization View content view environment. The activation key streamlines host registration by bundling the content view and environment assignments.

### Audience and Time
Intermediate administrators familiar with Satellite content views and activation keys. Requires the `bootc` product from Module 02 and a Web UI login. Estimated duration: 4 minutes.

### Learning Objectives
- Create a Satellite activation key named `bootc` and assign it the Library / Default Organization View content view environment.

### Lab Structure
| Section | Title | Duration |
|---------|-------|----------|
| 1 | Create an activation key for our image mode host | 4 min |

### Detailed Steps
1. In the Satellite Web UI, navigate to Content > Activation Keys.
2. Click Create Activation Key.
3. Name the activation key `bootc`.
4. Assign the Library lifecycle environment and the Default Organization View content view.
5. Save the activation key.
6. Confirm the `bootc` activation key appears with the correct environment and content view.

### Key Takeaways
- Activation keys bundle content view and lifecycle environment assignments for repeatable host registration.
- The `bootc` activation key targets the Library / Default Organization View, later used to register `rhel2`.

### Infrastructure Notes
Web UI task only. Depends on the Default Organization View content view and Library lifecycle environment being present (pre-provisioned). A validate playbook can confirm the activation key exists with the correct environment.
