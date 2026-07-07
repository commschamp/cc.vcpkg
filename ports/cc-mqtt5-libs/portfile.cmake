vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO commschamp/cc.mqtt5.libs
    REF v1.0.8
    SHA512 6c37c3aea82bbbd53e44a3baa42ed72f723e9abf6262a548c8993efa2df1aa7f84b922a23dbd394f90fef0b61567a1581c9a49274d2262a94bd5dffd255b8c8b
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
