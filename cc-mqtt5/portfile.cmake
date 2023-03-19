vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO commschamp/cc.mqtt5.generated
    REF v2.2.1
    SHA512 472fd73239305b46a5d6ccc0fe560844d3c7b8e573cf0f9979099d82a219c44bb937f6676087b2eb29398bd6ef0dd80c84fcb83b9b511db4c63eb730dfdcdab1
    HEAD_REF master
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup(PACKAGE_NAME cc_mqtt5 CONFIG_PATH lib/cc_mqtt5/cmake)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/lib")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")


file(INSTALL "${CURRENT_PORT_DIR}/copyright" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
configure_file("${CMAKE_CURRENT_LIST_DIR}/usage" "${CURRENT_PACKAGES_DIR}/share/${PORT}/usage" @ONLY)
