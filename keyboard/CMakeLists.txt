add_executable(${KEYBOARD_NAME} MACOSX_BUNDLE
    KeyboardViewController.swift
    KeyboardView.swift
)

if ("${CMAKE_GENERATOR}" STREQUAL "Ninja")
    target_link_libraries(${KEYBOARD_NAME} PRIVATE
        "-Xlinker -e -Xlinker _NSExtensionMain -application-extension"
    )
endif()

if ("${CMAKE_GENERATOR}" STREQUAL "Xcode")
    set_target_properties(${KEYBOARD_NAME} PROPERTIES
    XCODE_PRODUCT_TYPE "com.apple.product-type.app-extension"
)
endif()

configure_file("${CMAKE_CURRENT_SOURCE_DIR}/Info.plist.in" "${CMAKE_CURRENT_BINARY_DIR}/Info.plist" @ONLY)
set_target_properties(${KEYBOARD_NAME} PROPERTIES
    MACOSX_BUNDLE_INFO_PLIST "${CMAKE_CURRENT_BINARY_DIR}/Info.plist"
)
