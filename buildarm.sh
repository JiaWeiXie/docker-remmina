#!/bin/bash

IMAGE='remmina'
META_TAG='dev'


docker buildx build --no-cache -t ${IMAGE}:${META_TAG} --platform=linux/aarch64 -f Dockerfile.aarch64 .
