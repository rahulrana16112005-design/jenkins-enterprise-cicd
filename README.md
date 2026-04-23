### Jenkins CI/CD Pipeline

Production-Style DevOps Implementation (Local | Cloud-Independent)

## Project Overview

This project demonstrates a production-grade Jenkins CI/CD pipeline implemented entirely on a local Ubuntu environment. It is designed to simulate real-world DevOps practices without relying on cloud providers such as AWS.

The pipeline automates the complete software delivery lifecycle, including build, containerization, Kubernetes deployment, health validation, and automated rollback, following industry-standard CI/CD principles.

## Key Objectives :-
Design and implement a realistic CI/CD workflow using Jenkins Declarative Pipelines
Deploy containerized applications to Kubernetes using Minikube
Ensure deployment reliability using health checks and automated rollback
Follow idempotent automation practices (install tools only if missing)
## CI/CD Architecture Flow

Developer pushes code
↓
GitHub Webhook
↓
Jenkins Declarative Pipeline
↓
Prechecks and Environment Validation
↓
Docker Image Build
↓
Docker Image Tagging and Push to Registry
↓
Kubernetes Deployment
↓
Deployment Health Validation
↓
Automatic Rollback on Failure

## Technology Stack
Jenkins – CI/CD orchestration using Declarative Pipelines
Docker – Application containerization
Docker Hub – Container image registry
Kubernetes (Minikube) – Container orchestration platform
Shell Scripting – Automation and control logic
Nginx – Demo web application
## Project Structure
jenkins-cicd/
├── app/
│   ├── index.html
│   ├── Dockerfile
│   └── nginx.conf
├── jenkins/
│   ├── Jenkinsfile
│   └── agent.Dockerfile
├── k8s/
│   ├── deployment.yaml
│   ├── service.yaml
│   └── hpa.yaml
├── scripts/
│   ├── precheck.sh
│   ├── deploy.sh
│   ├── rollback.sh
├── monitoring/
│   └── prometheus.yaml
└── README.md
## Core Features
Declarative Jenkins pipeline (no freestyle jobs)
Dynamic Jenkins agents using Docker
Docker image tagging using Jenkins build numbers
Kubernetes rollout status validation
Automated rollback on deployment failure
Container-level and application-level health checks
Idempotent installation logic to prevent redundant installs
## Prerequisites
The following tools must be installed on the Ubuntu system:
Java 17 or higher
Jenkins
Docker
kubectl
Minikube

No cloud account or AWS access is required.

## Monitoring Stack

This project uses Prometheus and Grafana to monitor Kubernetes workloads.

## Metrics Collected
Pod health
CPU usage
Memory usage
Access
Prometheus: kubectl port-forward
Grafana: kubectl port-forward
## How to Run the Project
1. Start the Kubernetes Cluster
minikube start --driver=docker
2. Verify Cluster Status
kubectl get nodes
3. Configure Jenkins Job
Create a new Jenkins Pipeline job
Configure the pipeline to point to this repository

## Set the script path to:

jenkins/Jenkinsfile
4. Trigger the Pipeline

Run the pipeline using Build Now in Jenkins

Verification
kubectl get pods
kubectl get svc
minikube service demo-service

If successful, the deployed application will open in the browser.

## 🧪 Real Debugging Experience

While building this project, things did not work smoothly at all.

I faced multiple issues like:

Broken Jenkins builds
Pipeline failures at different stages
Docker image build and push errors
Kubernetes deployment not working properly

At one point, I had around 25 failed builds continuously.

But after debugging each issue step by step, I finally got a successful build on attempt #26 ✅

This phase helped me understand:

How to read logs and trace errors
How different tools in the pipeline are connected
Why small misconfigurations can break the entire system

This was the most important part of my learning, because I didn’t just run the pipeline —
I actually fixed it when it broke.

## Rollback Strategy

If any pipeline stage fails, Jenkins automatically triggers a Kubernetes rollback.
The previous stable deployment is restored using:

kubectl rollout undo deployment/demo-app
## Summary

Designed and implemented a Jenkins CI/CD pipeline featuring Dockerized builds, Kubernetes deployments, health validation, and automated rollback mechanisms, all implemented locally without cloud dependencies.

## Author

Rahul Rana
DevOps | CI/CD | Docker | Kubernetes | Jenkins
