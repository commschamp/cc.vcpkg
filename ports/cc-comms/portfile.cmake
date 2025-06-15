vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO commschamp/comms
    REF v5.4.3
    SHA512 30269df975c429fe0898db7e4c753adf8141856b61ad1d9a0ddbbec019c610d916fe294b7b46cc342b49fcaf67f09ce98854a15128f168bee79e543ebb11aeb4
    HEAD_REF master
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup(PACKAGE_NAME LibComms CONFIG_PATH lib/LibComms/cmake)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/lib")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")


file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
configure_file("${CMAKE_CURRENT_LIST_DIR}/usage" "${CURRENT_PACKAGES_DIR}/share/${PORT}/usage" @ONLY)
