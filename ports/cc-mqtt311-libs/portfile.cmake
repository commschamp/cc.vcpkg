vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO commschamp/cc.mqtt311.libs
    REF v1.0.6
    SHA512 abe529e6828e25fb8ad0db9827a210560ba80ede9c99442a29f116032c3d4771636799765e512011dd8a18851981c0bef6226fb142b4984b6a20abdc2920a579
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
