SCRIPT_DIR="$( cd "$(dirname "${BASH_SOURCE[0]}" )" && pwd )"
ROOT_DIR=$(realpath $(dirname ${SCRIPT_DIR}))
export VCPKG_OVERLAY_PORTS=${ROOT_DIR}/ports
