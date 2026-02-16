FROM jenkins/inbound-agent:latest

USER root

RUN set -eux; \
    apt-get update; \
    \
    if ! command -v docker >/dev/null 2>&1; then \
        apt-get install -y docker.io; \
    fi; \
    \
    if ! command -v kubectl >/dev/null 2>&1; then \
        curl -fsSL https://dl.k8s.io/release/$(curl -fsSL https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl \
        -o /usr/local/bin/kubectl && \
        chmod +x /usr/local/bin/kubectl; \
    fi; \
    \
    if ! command -v curl >/dev/null 2>&1; then \
        apt-get install -y curl; \
    fi; \
    \
    apt-get clean && rm -rf /var/lib/apt/lists/*

USER jenkins

