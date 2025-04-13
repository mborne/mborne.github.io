file(GLOB EXAMPLE_FILES "${CMAKE_SOURCE_DIR}/example/*.cpp")
foreach(EXAMPLE_FILE ${EXAMPLE_FILES})
    get_filename_component(EXAMPLE_NAME "${EXAMPLE_FILE}" NAME_WE)

    add_executable(
        ${EXAMPLE_NAME}
        ${EXAMPLE_FILE}
    )
    set_property(TARGET ${EXAMPLE_NAME} PROPERTY CXX_STANDARD 14)
    target_link_libraries(${EXAMPLE_NAME}
        ${LevelDB_LIBRARIES}
        ${Boost_LIBRARIES}
    )
endforeach()
