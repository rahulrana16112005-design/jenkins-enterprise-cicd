FROM jenkins/inbound-agent:latest

USER root

# Docker + kubectl
RUN apt-get update && \
    apt-get install -y docker.io curl wget ca-certificates && \
    curl -fsSL https://dl.k8s.io/release/$(curl -fsSL https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl \
      -o /usr/local/bin/kubectl && \
    chmod +x /usr/local/bin/kubectl && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Trivy (stable & safe)
RUN wget -O /tmp/trivy.deb https://github.com/aquasecurity/trivy/releases/latest/download/trivy_0.69.1_Linux-64bit.deb && \
    dpkg -i /tmp/trivy.deb || apt-get -f install -y && \
    rm -f /tmp/trivy.deb
