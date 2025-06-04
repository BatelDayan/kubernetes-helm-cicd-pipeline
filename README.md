# kubernetes-helm-cicd-pipeline

# CI/CD Pipeline with Jenkins, Docker Hub, Helm & Kubernetes

This repository contains everything needed to build a CI/CD pipeline for deploying containerized applications to a Kubernetes cluster using **Jenkins**, **Docker Hub**, and **Helm**.

## 📁 Project Structure

```
├── Dockerfile
├── Jenkinsfile
├── helm-chart/
│   ├── Chart.yaml
│   ├── values.yaml
│   └── templates/
│       ├── deployment.yaml
│       └── service.yaml
```


---

## 🚀 Pipeline Overview

Each time a change is pushed to the repository (e.g. updated app code, Dockerfile, or Helm chart), the Jenkins pipeline will:

1. **Build the Docker image** from the `Dockerfile`.
2. **Tag and push** the image to **Docker Hub**.
3. **Deploy or upgrade** the app in the Kubernetes cluster using **Helm**.

---

## 🔧 Prerequisites

To use this pipeline, make sure you have the following configured:

- ✅ A **Jenkins server** with the following plugins installed:
  - Docker Pipeline
  - Git
  - Pipeline Utility Steps
  - Credentials Binding
  - Kubernetes CLI (kubectl) plugin
- ✅ A **Docker Hub account**
- ✅ A **Kubernetes cluster** with `kubectl` access from Jenkins
- ✅ `helm` and `kubectl` installed on the Jenkins machine or agent
- ✅ A Jenkins credential (`dockerhub-creds`) with your Docker Hub username and password

---

## ⚙️ Jenkins Setup

1. **Create Jenkins Credentials**:
   - Go to `Manage Jenkins` > `Credentials` > `Global` > `Add Credentials`
   - Add Docker Hub credentials as `dockerhub-creds`

2. **Configure Jenkins Job**:
   - Point your Jenkins job to this GitHub repository.
   - Make sure your Jenkins agent has access to Docker, kubectl, and helm.

---

## 🔄 How It Works

1. Jenkins triggers the pipeline (manually or on code push).
2. Docker image is built and pushed:

docker build -t youruser/image-name:tag .
docker push youruser/image-name:tag

3. Helm uses the pushed image to deploy or upgrade the app in the cluster:
```bash
helm upgrade --install my-app ./helm-chart \
  --set image.repository=youruser/image-name \
  --set image.tag=tag

