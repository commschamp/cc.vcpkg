vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO commschamp/commsdsl
    REF v7.0.2
    SHA512 5943fa3eef36f0b5d988b5dde536b4e91a718277aeb35c8c65935263d03fcb25ae7f91e91f9b0f036834a7f4482e3bcd044901be62115ff7f97e5aaa34025322
    HEAD_REF master
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DCOMMSDSL_WARN_AS_ERR=OFF
        -DCOMMSDSL_INSTALL_LIBRARY=ON
        -DCOMMSDSL_BUILD_COMMSDSL2TEST=ON
        -DCOMMSDSL_BUILD_COMMSDSL2TOOLS_QT=ON
        -DCOMMSDSL_BUILD_COMMSDSL2SWIG=ON
        -DCOMMSDSL_BUILD_COMMSDSL2EMSCRIPTEN=ON
)

vcpkg_cmake_install()

vcpkg_copy_tools(
    TOOL_NAMES commsdsl2comms commsdsl2test commsdsl2tools_qt commsdsl2swig commsdsl2emscripten
    AUTO_CLEAN
)

vcpkg_cmake_config_fixup(PACKAGE_NAME LibCommsdsl CONFIG_PATH lib/LibCommsdsl/cmake)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/lib/LibCommsdsl")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/lib/LibCommsdsl")

file(INSTALL "${SOURCE_PATH}/LICENSE.txt" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
configure_file("${CMAKE_CURRENT_LIST_DIR}/usage" "${CURRENT_PACKAGES_DIR}/share/${PORT}/usage" @ONLY)
