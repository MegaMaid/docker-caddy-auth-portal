#!/usr/bin/env sh
set -e

# IMAGE=$1
# BUILDER=$2

IMAGE=megamaid/caddy-auth-portal
BUILDER=qemubuilder

docker run --rm --privileged multiarch/qemu-user-static --reset -p yes
docker buildx create --use --name "${BUILDER}" || docker buildx use "${BUILDER}"
# docker buildx build --no-cache --pull --platform linux/amd64,linux/arm,linux/arm64 -t "${IMAGE}:latest" .
docker buildx build --no-cache --pull --platform linux/amd64 -t "${IMAGE}:latest" .