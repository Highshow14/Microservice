# Microservice Deployment Pipeline (CI/CD with CircleCI + ArgoCD)

This project demonstrates a complete CI/CD pipeline using **GitHub**, **CircleCI**, **Docker Hub**, **Helm**, and **ArgoCD** to build, test, scan, deploy, and continuously deliver a Kubernetes-based microservice.

---

## 📦 Tech Stack

- **GitHub** – Source code and Helm chart storage (GitOps)
- **CircleCI** – Continuous Integration and automation
- **Docker Hub** – Container image registry
- **Helm** – Kubernetes deployment templating
- **ArgoCD** – GitOps Continuous Delivery
- **Kubernetes** – Application runtime environment
- **Trivy** – Container vulnerability scanning

---

## ⚙️ Workflow Overview

```text
Developer pushes code to GitHub →
  CircleCI:
    - Builds Docker image
    - Scans image with Trivy
    - Pushes image to Docker Hub
    - Updates Helm chart with new tag
    - Pushes updated chart back to GitHub →
  ArgoCD:
    - Auto-syncs updated Helm chart
    - Deploys new version to Kubernetes


📁 Project Structure
.
├── microservice/                  # Source code of the microservice
├── helm-chart/
│   └── myservice/
│       ├── Chart.yaml            # Helm chart metadata
│       ├── templates/            # Kubernetes manifests
│       └── values.yaml           # Configurable values (e.g. image tag)
├── .circleci/
│   └── config.yml                # CircleCI pipeline definition
├── .gitignore


🔄 CI/CD Pipeline (CircleCI)
CircleCI is triggered on every commit to the main branch. Here's what it does:
Checkout code
Build Docker image with docker build
Scan image for vulnerabilities using Trivy
Push image to Docker Hub
Update Helm chart (values.yaml) with the new image tag
Push chart changes back to GitHub
➡ This triggers ArgoCD to sync and deploy the new version.
🚀 Deployment (ArgoCD + Helm)
ArgoCD continuously monitors the GitHub repo for changes in the Helm chart and syncs the updated application to Kubernetes using the Helm values and templates.
App name: myservice
Namespace: default
Chart path: helm-chart/myservice
🔐 Secrets Management
The following secrets are used in CircleCI:
Secret Name	Purpose
DOCKERHUB_USERNAME	Docker Hub login
DOCKERHUB_PASSWORD	Docker Hub password
GITHUB_TOKEN	GitHub token to push chart
Add these in Project Settings → Environment Variables on CircleCI.


✅ Prerequisites
Docker Hub account
Kubernetes cluster (e.g. via Minikube or any cloud)
ArgoCD installed and running
CircleCI project connected to your GitHub repo
Helm installed locally for chart development

🧪 Optional Enhancements
Add unit tests to the microservice and run in CI
Use Kustomize for managing multiple environments (dev, prod)
Add Prometheus/Grafana for monitoring
Use sealed secrets or external secret managers (like Vault)

📸 Sample Output
ArgoCD logs (after sync):
application":"myservice","msg":"Reconciliation completed","status":"Synced"
CircleCI pipeline:
✅ Build Docker Image
✅ Scan with Trivy
✅ Push Docker Image
✅ Update Helm Chart
✅ Push Helm Update

🙌 Credits
CI/CD by CircleCI
GitOps by ArgoCD
Container Scanning by Trivy
Charts powered by Helm


📬 Author
Highshow14
This project is built as a DevOps workflow sample for microservices on Kubernetes.