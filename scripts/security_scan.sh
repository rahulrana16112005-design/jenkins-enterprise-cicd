#!/bin/bash
trivy image --severity HIGH,CRITICAL --exit-code 1 yourdockerhub/demo:8

