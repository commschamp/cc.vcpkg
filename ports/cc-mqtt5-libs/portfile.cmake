vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO commschamp/cc.mqtt5.libs
    REF v1.0.5
    SHA512 1d040ad3869af23d725ba16da6d918576661a961f516ef0b886765e0bf1b6f26a7ed11c90f8c9c3bafe6790639a5ee1fd9756b0c8b76a4a2d9e57d5e3d7caa99
    HEAD_REF master
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DCC_MQTT5_CLIENT_DEFAULT_LIB=ON
        -DCC_MQTT5_CLIENT_APPS=OFF
        -DCC_MQTT5_WARN_AS_ERR=OFF
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(PACKAGE_NAME cc_mqtt5_client CONFIG_PATH lib/cc_mqtt5_client/cmake)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/share/doc")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/lib")

file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
configure_file("${CMAKE_CURRENT_LIST_DIR}/usage" "${CURRENT_PACKAGES_DIR}/share/${PORT}/usage" @ONLY)
