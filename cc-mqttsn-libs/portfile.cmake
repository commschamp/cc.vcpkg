vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO commschamp/cc.mqttsn.libs
    REF v1.0.2
    SHA512 192303b4ffdf9b60919b66cb921dfa99b3ba7922f24437b520b877eb4fd6d1b20ff6324703aba0b3af44c9560aa2bb2397d75e6fac8079db2e1fd3a678669012
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
