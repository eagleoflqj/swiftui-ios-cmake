add_executable(${BUNDLE_NAME} MACOSX_BUNDLE
    ContentView.swift
    MyApp.swift
)

if ("${CMAKE_GENERATOR}" STREQUAL "Ninja")
    install(FILES "${PROJECT_SOURCE_DIR}/assets/${ICON_FILE}"
        DESTINATION "${PROJECT_BINARY_DIR}/src/${BUNDLE_NAME}.app"
    )
endif()

if ("${CMAKE_GENERATOR}" STREQUAL "Xcode")
    add_custom_command(TARGET ${BUNDLE_NAME}
        POST_BUILD COMMAND /bin/sh -c \"
        ${CMAKE_COMMAND} -E copy ${PROJECT_SOURCE_DIR}/assets/${ICON_FILE}
            ${PROJECT_BINARY_DIR}/src/$<CONFIG>-${SDK_NAME}/${BUNDLE_NAME}.app
    \")
endif()
