add_executable(${BUNDLE_NAME} MACOSX_BUNDLE
    ContentView.swift
    MyApp.swift
)

if ("${CMAKE_GENERATOR}" STREQUAL "Ninja")
    set(APP_DIR "${PROJECT_BINARY_DIR}/src/${BUNDLE_NAME}.app")
    install(FILES "${PROJECT_SOURCE_DIR}/assets/${ICON_FILE}"
        DESTINATION "${APP_DIR}"
    )

    if (ENABLE_KEYBOARD)
        install(DIRECTORY "${PROJECT_BINARY_DIR}/keyboard/${KEYBOARD_NAME}.app/"
            DESTINATION "${APP_DIR}/PlugIns/${KEYBOARD_NAME}.appex"
        )
    endif()
endif()

if ("${CMAKE_GENERATOR}" STREQUAL "Xcode")
    add_custom_command(TARGET ${BUNDLE_NAME}
        POST_BUILD COMMAND /bin/sh -c \"
        ${CMAKE_COMMAND} -E copy ${PROJECT_SOURCE_DIR}/assets/${ICON_FILE}
            ${PROJECT_BINARY_DIR}/src/$<CONFIG>-${SDK_NAME}/${BUNDLE_NAME}.app
    \")

    if (ENABLE_KEYBOARD)
        add_dependencies(${BUNDLE_NAME} ${KEYBOARD_NAME})
        add_custom_command(TARGET ${BUNDLE_NAME}
            POST_BUILD COMMAND /bin/sh -c \"
            ${CMAKE_COMMAND} -E copy_directory ${PROJECT_BINARY_DIR}/keyboard/$<CONFIG>-${SDK_NAME}/${KEYBOARD_NAME}.appex
                ${PROJECT_BINARY_DIR}/src/$<CONFIG>-${SDK_NAME}/${BUNDLE_NAME}.app/PlugIns/${KEYBOARD_NAME}.appex
        \")
    endif()
endif()
