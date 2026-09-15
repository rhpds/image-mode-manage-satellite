# Module 02 — Create Container Repository

### Brief Overview
This module creates a Satellite Product to serve as the container repository for image mode container images. Working entirely in the Satellite Web UI, the learner navigates to Content > Products and creates a product named `bootc`. This repository is where the customized bootc image will later be published and served from Satellite's internal container registry.

### Audience and Time
Intermediate administrators comfortable navigating the Satellite Web UI. Requires a successful Web UI login from Module 01. Estimated duration: 3 minutes.

### Learning Objectives
- Create a Satellite Product named `bootc` under Content > Products to store image mode container images.

### Lab Structure
| Section | Title | Duration |
|---------|-------|----------|
| 1 | Create a container repository in Satellite | 3 min |

### Detailed Steps
1. In the Satellite Web UI, navigate to Content > Products.
2. Click Create Product.
3. Name the product `bootc`.
4. Save the product.
5. Confirm the `bootc` product appears in the Products list.

### Key Takeaways
- Satellite Products act as containers for repositories, including container image repositories.
- A dedicated `bootc` product organizes image mode container images for later publishing.

### Infrastructure Notes
Purely a Web UI task; no host or CLI interaction. Requires container management enabled on the Satellite organization (Default Organization). A validate playbook can confirm the `bootc` product exists.
