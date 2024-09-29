vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO commschamp/cc.mqtt311.libs
    REF v1.0.1
    SHA512 420137dec3b0fff8ed979dd9e775007f7e103653c33ff2b73207b2f04e4998aca4000ebc7eb3935edd851fc055b5b7c931fa85cc21eb6632dc2d966fd78fe0b0
    HEAD_REF master
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DCC_MQTT311_CLIENT_DEFAULT_LIB=ON
        -DCC_MQTT311_CLIENT_APPS=OFF
        -DCC_MQTT311_WARN_AS_ERR=OFF
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(PACKAGE_NAME cc_mqtt311_client CONFIG_PATH lib/cc_mqtt311_client/cmake)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/share/doc")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/lib")

file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
configure_file("${CMAKE_CURRENT_LIST_DIR}/usage" "${CURRENT_PACKAGES_DIR}/share/${PORT}/usage" @ONLY)
