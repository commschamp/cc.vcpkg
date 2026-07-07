vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO commschamp/cc.mqtt311.libs
    REF v1.0.8
    SHA512 7718397cf5cafc936d39860c1fc4436c50fcffef33d5ecf5feab2e7951269f4744b0e88a4d32bed51575759bee6159c1096fcb5648683770eefed2155a3c0705
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
