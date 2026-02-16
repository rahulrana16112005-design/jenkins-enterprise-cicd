FROM jenkins/inbound-agent:latest

USER root

# Docker + kubectl
RUN apt-get update && \
    apt-get install -y docker.io curl wget && \
    curl -fsSL https://dl.k8s.io/release/$(curl -fsSL https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl \
      -o /usr/local/bin/kubectl && \
    chmod +x /usr/local/bin/kubectl && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Trivy (FIXED version – no 404)
RUN wget https://github.com/aquasecurity/trivy/releases/latest/download/trivy_0.69.1_Linux-64bit.deb && \
    dpkg -i trivy_0.69.1_Linux-64bit.deb

