🚀 Enterprise-Grade Jenkins CI/CD Pipeline

Production-Style DevSecOps Implementation (Local | No AWS)

📌 Project Overview

This project demonstrates a production-grade Jenkins CI/CD pipeline built entirely on a local Ubuntu environment, simulating real-world DevOps and DevSecOps practices without relying on cloud services like AWS.

The pipeline automates build, security scanning, containerization, Kubernetes deployment, health validation, and rollback, following enterprise-level standards.

🎯 Key Objectives

Implement a realistic CI/CD workflow using Jenkins Declarative Pipelines

Apply DevSecOps principles with vulnerability scanning

Deploy containerized applications to Kubernetes (Minikube)

Ensure stability and reliability with health checks and rollback

Follow idempotent practices (install only if missing)

🧠 Architecture Flow
Developer Push Code
      ↓
GitHub Webhook
      ↓
Jenkins Pipeline (Declarative)
      ↓
Prechecks & Environment Validation
      ↓
Docker Image Build
      ↓
Security Scan (Trivy)
      ↓
Docker Image Tag & Push
      ↓
Kubernetes Deployment
      ↓
Health Check Validation
      ↓
Auto Rollback (on failure)

🧩 Technology Stack

Jenkins – CI/CD Orchestration (Declarative Pipeline)

Docker – Containerization

DockerHub – Image Registry

Kubernetes (Minikube) – Container Orchestration

Trivy – Security Vulnerability Scanning

Shell Scripting – Automation & Control Logic

Nginx – Demo Web Application

📁 Project Structure
jenkins-enterprise-cicd/
│
├── app/
│   ├── index.html
│   ├── Dockerfile
│   └── nginx.conf
│
├── jenkins/
│   ├── Jenkinsfile
│   └── agent.Dockerfile
│
├── k8s/
│   ├── deployment.yaml
│   ├── service.yaml
│   └── hpa.yaml
│
├── scripts/
│   ├── precheck.sh
│   ├── deploy.sh
│   ├── rollback.sh
│   └── security_scan.sh
│
├── monitoring/
│   └── prometheus.yaml
│
└── README.md

🔑 Core Features

✅ Declarative Jenkins pipeline (no freestyle jobs)

✅ Dynamic Jenkins agents using Docker

✅ Docker image tagging with Jenkins build numbers

✅ Trivy-based security scanning (HIGH & CRITICAL vulnerabilities)

✅ Kubernetes rollout status validation

✅ Automated rollback on deployment failure

✅ Health checks at container and application level

✅ Idempotent installation logic (skip if already installed)

🛠️ Prerequisites

Ensure the following are installed on Ubuntu:

Java 17+

Jenkins

Docker

kubectl

Minikube

⚠️ No cloud account or AWS access required.

🚀 How to Run the Project
1️⃣ Start Kubernetes Cluster
minikube start --driver=docker

2️⃣ Verify Cluster
kubectl get nodes

3️⃣ Configure Jenkins Job

Create a Pipeline job

Point to this repository

Script path: jenkins/Jenkinsfile

4️⃣ Trigger Build
Jenkins → Build Now

✅ Verification
kubectl get pods
kubectl get svc
minikube service demo-service


If successful, the application will open in the browser.

🔄 Rollback Strategy

If any stage fails:

Jenkins automatically triggers Kubernetes rollback

Previous stable deployment is restored using:

kubectl rollout undo deployment/demo-app

🔐 Security Implementation

Trivy scans Docker images before deployment

Pipeline fails on HIGH or CRITICAL vulnerabilities

Prevents insecure images from reaching Kubernetes

📈 Resume-Ready Description

Designed and implemented an enterprise-grade Jenkins CI/CD pipeline with Dockerized builds, security vulnerability scanning, Kubernetes deployments, health validation, and automated rollback strategy — all built locally without cloud dependencies.

👨‍💻 Author

Rahul Rana
DevOps | CI/CD | Docker | Kubernetes | Jenkins
