#!/bin/bash
set -e

NAMESPACE=default

echo "Applying Kubernetes manifests..."
kubectl apply -f k8s/

echo "Waiting for deployment rollout..."
kubectl rollout status deployment/ranga-app --timeout=120s

echo "Deployment successful"

