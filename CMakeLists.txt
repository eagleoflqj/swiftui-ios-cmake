cmake_minimum_required(VERSION 4.3)

set(DEPLOYMENT_TARGET 16.3)
set(CMAKE_TOOLCHAIN_FILE "${CMAKE_CURRENT_LIST_DIR}/ios-cmake/ios.toolchain.cmake")

project(my-app VERSION 0.1.0 LANGUAGES Swift)
set(BUNDLE_IDENTIFIER "com.liumeo.my-app")
set(BUNDLE_NAME "MyApp")
set(ICON_FILE "icon.icns")

set(CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake" ${CMAKE_MODULE_PATH})

add_subdirectory(src)
