#!/bin/bash
set -e

NAMESPACE=default

echo "Applying Kubernetes manifests..."
kubectl apply -f k8s/ -n $NAMESPACE

echo "Waiting for deployment rollout..."
kubectl rollout status deployment/ranga-app -n $NAMESPACE

echo "Deployment successful"

