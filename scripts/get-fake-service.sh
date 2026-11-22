#!/bin/bash
set -euo pipefail

VERSION="v0.26.2"
URL="https://github.com/nicholasjackson/fake-service/releases/download/${VERSION}/fake_service_linux_amd64.zip"

mkdir -p bin && cd bin
curl -fsSL -o fake-service.zip "$URL"
unzip -o fake-service.zip
rm fake-service.zip
chmod +x fake-service
