vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO commschamp/commsdsl
    REF v7.1.1
    SHA512 31865255fc2e90c726fa6e41da1dcad612ff041d3dba277195ddb679dac47ba4db9e824e019e06ffc0ecfd92fc49327854b45e6a1e2533aadb1b29bcc7461df8
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
