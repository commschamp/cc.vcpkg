vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO commschamp/cc.mqtt311.generated
    REF v3.0.2
    SHA512 cd74dbc99898ed4116ebcc0f6e217aef6410a65c4453b0663c0e595645b387d203748baf803ffb2cf66eb4a78eb23c65a5079bf3dce2c160d4598c66230f256d
    HEAD_REF master
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup(PACKAGE_NAME cc_mqtt311 CONFIG_PATH lib/cc_mqtt311/cmake)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/lib")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")


file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
configure_file("${CMAKE_CURRENT_LIST_DIR}/usage" "${CURRENT_PACKAGES_DIR}/share/${PORT}/usage" @ONLY)
