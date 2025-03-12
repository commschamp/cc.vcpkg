vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO commschamp/cc.ublox.generated
    REF v3.0.2
    SHA512 d4d696e2e867f73369a1e275b4deface5149039c834c48baaa3cd9a4fc7b960020af87e915b8622373c666960954e57688bddc51c6ac6968e9b970ea682cdd83
    HEAD_REF master
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup(PACKAGE_NAME cc_ublox CONFIG_PATH lib/cc_ublox/cmake)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/lib")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")


file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
configure_file("${CMAKE_CURRENT_LIST_DIR}/usage" "${CURRENT_PACKAGES_DIR}/share/${PORT}/usage" @ONLY)
