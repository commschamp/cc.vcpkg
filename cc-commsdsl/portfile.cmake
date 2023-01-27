vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO commschamp/commsdsl
    REF v5.2
    SHA512 b6bcc40a9d78fc9d8ddf195b87072b3148e89210fa7c75dc1d7ab9fe35148cf122bf1a4c7ce2cdf94beba8d95ee372a3b5acc386b55485c935f46a1a49a33efa
    HEAD_REF master
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DCOMMSDSL_BUILD_COMMSDSL2TEST=ON
        -DCOMMSDSL_BUILD_COMMSDSL2TOOLS_QT=ON
        -DCOMMSDSL_BUILD_COMMSDSL2SWIG=ON
        -DCOMMSDSL_BUILD_COMMSDSL2EMSCRIPTEN=ON
        -DCOMMSDSL_WIN_ALLOW_LIBXML_BUILD=OFF
        -DCOMMSDSL_INSTALL_LIBRARY=ON
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
