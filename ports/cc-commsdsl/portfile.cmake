vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO commschamp/commsdsl
    REF v8.0
    SHA512 99a85346b3e6b504b612e4057d5e4e80fb730461287d1348ca8ab5431a2bd6bbe4bf0ed91c4c546c6c2f6fdc455deefa43e9fc48e452fd7056401aab89e04f96
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
)

vcpkg_cmake_install()

vcpkg_copy_tools(
    TOOL_NAMES commsdsl2comms commsdsl2test commsdsl2tools_qt commsdsl2swig commsdsl2emscripten commsdsl2latex commsdsl2c
    AUTO_CLEAN
)

vcpkg_cmake_config_fixup(PACKAGE_NAME LibCommsdsl CONFIG_PATH lib/LibCommsdsl/cmake)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/lib/LibCommsdsl")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/lib/LibCommsdsl")

file(INSTALL "${SOURCE_PATH}/LICENSE.txt" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
configure_file("${CMAKE_CURRENT_LIST_DIR}/usage" "${CURRENT_PACKAGES_DIR}/share/${PORT}/usage" @ONLY)
