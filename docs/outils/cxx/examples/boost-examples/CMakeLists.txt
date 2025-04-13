cmake_minimum_required(VERSION 3.5.1)
project(BOOST_EXAMPLES)

set (CMAKE_CXX_STANDARD 20)

find_package(Boost COMPONENTS locale REQUIRED)
include_directories(
    include
    ${OPENSCENEGRAPH_INCLUDE_DIRS}
)

file(GLOB APP_FILES
    boost-graph-helloworld.cpp
    boost-multi-index.cpp
    boost-ublas-gmp.cpp
    boost-ublas-projection.cpp
    boost-variant-binary-visitor.cpp
)
foreach(APP_FILE ${APP_FILES})
    message(STATUS "APP_FILE : ${APP_FILE}")
    get_filename_component(APP_NAME "${APP_FILE}" NAME_WE)

    add_executable(
        ${APP_NAME}
        ${APP_FILE}
    )
    set_property(TARGET ${APP_NAME} PROPERTY CXX_STANDARD 14)
    target_link_libraries(${APP_NAME} 
        ${Boost_LIBRARIES}
        gmp # WARNING: hardcoded (missing finder)
    )
endforeach()

