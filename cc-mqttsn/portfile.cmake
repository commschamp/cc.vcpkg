vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO commschamp/cc.mqttsn.generated
    REF v2.0
    SHA512 52a9a05559ea1280ba736b4891d8159137c824c3959366d0d544eadf142769ec594133f2a2fa642be5b96d58889ced881d1953baa2f2555a5de789714059b588
    HEAD_REF master
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup(PACKAGE_NAME cc_mqttsn CONFIG_PATH lib/cc_mqttsn/cmake)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/lib")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")


file(INSTALL "${CURRENT_PORT_DIR}/copyright" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
configure_file("${CMAKE_CURRENT_LIST_DIR}/usage" "${CURRENT_PACKAGES_DIR}/share/${PORT}/usage" @ONLY)
