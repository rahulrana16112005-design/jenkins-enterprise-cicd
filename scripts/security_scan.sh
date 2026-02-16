#!/bin/bash
trivy image --severity HIGH,CRITICAL yourdockerhub/ranga:latest
