#!/bin/bash
command -v docker >/dev/null || exit 1
command -v kubectl >/dev/null || exit 1
echo "Prechecks OK"
