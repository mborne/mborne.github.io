cmake_minimum_required(VERSION 3.5.1)
project(OsgExample)

find_package(OpenSceneGraph REQUIRED osgDB osgUtil osgViewer osgGA osgSim osgTerrain)
include_directories(
    include
    ${OPENSCENEGRAPH_INCLUDE_DIRS}
)

file(GLOB APP_FILES "${CMAKE_SOURCE_DIR}/app/*.cpp")
foreach(APP_FILE ${APP_FILES})
    message(STATUS "APP_FILE : ${APP_FILE}")
    get_filename_component(APP_NAME "${APP_FILE}" NAME_WE)

    add_executable(
        ${APP_NAME}
        ${APP_FILE}
    )
    set_property(TARGET ${APP_NAME} PROPERTY CXX_STANDARD 14)
    target_link_libraries(${APP_NAME} ${OPENSCENEGRAPH_LIBRARIES})
endforeach()

