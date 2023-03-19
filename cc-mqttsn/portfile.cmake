vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO commschamp/cc.mqttsn.generated
    REF v2.2
    SHA512 27c9d2159452a04738ef6ab6fd02f387a6200bb3a3ced17b8092ad2332fb3e1c3145ef2be6988afad868b6ad45dec052c9032b327093554824b05ffb936b11bf
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
