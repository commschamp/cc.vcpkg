vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO commschamp/cc.mqttsn.libs
    REF v2.0.9
    SHA512 123a8412f13771535007d02a13a3b9547d44b7d66f39963bc245bcd9612a7a148e412925c90e243178b179e3ae9f3050aa45ef9fd0263b0d2baad7efd1155451
    HEAD_REF master
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DCC_MQTTSN_CLIENT_APPS=OFF
        -DCC_MQTTSN_GATEWAY_APPS=OFF
        -DCC_MQTTSN_WARN_AS_ERR=OFF
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(PACKAGE_NAME cc_mqttsn_client CONFIG_PATH lib/cc_mqttsn_client/cmake)
vcpkg_cmake_config_fixup(PACKAGE_NAME cc_mqttsn_gateway CONFIG_PATH lib/cc_mqttsn_gateway/cmake)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/share/doc")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/lib")

file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
configure_file("${CMAKE_CURRENT_LIST_DIR}/usage" "${CURRENT_PACKAGES_DIR}/share/${PORT}/usage" @ONLY)
