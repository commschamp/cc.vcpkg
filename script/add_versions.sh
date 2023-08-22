#!/usr/bin/env bash

if [ -z "${vcpkg}" ]; then
    echo "ERROR: vcpkg variable is not defined"
    exit 1
fi

SCRIPT_DIR="$( cd "$(dirname "${BASH_SOURCE[0]}" )" && pwd )"
ROOT_DIR="$(dirname ${SCRIPT_DIR})"
echo "registry path: ${ROOT_DIR}"
echo "using vcpkg: ${vcpkg}"
${vcpkg} x-add-version --all --skip-formatting-check "--x-builtin-ports-root=${ROOT_DIR}/ports" "--x-builtin-registry-versions-dir=${ROOT_DIR}/versions"
