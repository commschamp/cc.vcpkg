vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO commschamp/commsdsl
    REF v8.1
    SHA512 d8f730500ee704e1ed84f829c5927e27fb2003f759377f006d7f385a0ac75563ca1987d1b5f66437e55c2c380c7130cc640dc75d6d3687a257046f9b486c65fa
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
        -DCOMMSDSL_BUILD_COMMSDSL2LATEX=ON
        -DCOMMSDSL_BUILD_COMMSDSL2C=ON
        -DCOMMSDSL_BUILD_COMMSDSL2WIRESHARK=ON
)

vcpkg_cmake_install()

vcpkg_copy_tools(
    TOOL_NAMES commsdsl2comms commsdsl2test commsdsl2tools_qt commsdsl2swig commsdsl2emscripten commsdsl2latex commsdsl2c commsdsl2wireshark
    AUTO_CLEAN
)

vcpkg_cmake_config_fixup(PACKAGE_NAME LibCommsdsl CONFIG_PATH lib/LibCommsdsl/cmake)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/lib/LibCommsdsl")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/lib/LibCommsdsl")

file(INSTALL "${SOURCE_PATH}/LICENSE.txt" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
configure_file("${CMAKE_CURRENT_LIST_DIR}/usage" "${CURRENT_PACKAGES_DIR}/share/${PORT}/usage" @ONLY)
