vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO commschamp/cc.mqtt311.libs
    REF v0.1
    SHA512 889da82c414cb2235f4866f20029fecdf306b7a6a01afc92f927a7832dd17d4334815bd00196cef3b6041f1ff16c6e073161c090359ca87e4bac8204fe09081a
    HEAD_REF master
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DCC_MQTT311_CLIENT_DEFAULT_LIB=ON
        -DCC_MQTT311_CLIENT_APPS=OFF
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(PACKAGE_NAME cc_mqtt311_client CONFIG_PATH lib/cc_mqtt311_client/cmake)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/share/doc")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/lib")

file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
configure_file("${CMAKE_CURRENT_LIST_DIR}/usage" "${CURRENT_PACKAGES_DIR}/share/${PORT}/usage" @ONLY)
