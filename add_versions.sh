#!/usr/bin/env bash

CUSTOM_REGISTRY=$(dirname "$0")
echo "registry path: $CUSTOM_REGISTRY"
echo "using vcpkg: ${vcpkg}"
${vcpkg} x-add-version --all --skip-formatting-check "--x-builtin-ports-root=${CUSTOM_REGISTRY}/ports" "--x-builtin-registry-versions-dir=${CUSTOM_REGISTRY}/versions"