vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO commschamp/cc.mqttsn.libs
    REF v1.0
    SHA512 c31577b7c8717fac09d6e0368213db691e1cc8d98c442b666002e08adf47a0a859aeb36ad024152b284874deb1fc0cc475d1d678be17922c8efbaaa345e7248e
    HEAD_REF master
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DCC_MQTTSN_BUILD_CLIENT_APPS=OFF
        -DCC_MQTTSN_BUILD_GATEWAY_APPS=OFF
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(PACKAGE_NAME cc_mqttsn_client CONFIG_PATH lib/cc_mqttsn_client/cmake)
vcpkg_cmake_config_fixup(PACKAGE_NAME cc_mqttsn_gateway CONFIG_PATH lib/cc_mqttsn_gateway/cmake)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/lib")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/share/doc")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/lib")

file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
configure_file("${CMAKE_CURRENT_LIST_DIR}/usage" "${CURRENT_PACKAGES_DIR}/share/${PORT}/usage" @ONLY)
