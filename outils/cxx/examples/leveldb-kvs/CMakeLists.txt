project( LKVS )
cmake_minimum_required( VERSION 3.5.1 )

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

set( CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake/Modules;${CMAKE_MODULE_PATH}" )

option(LKVS_BUILD_TESTS "Build tests" ON)
option(LKVS_BUILD_EXAMPLES "Build examples" ON)

include_directories(
    include
    ${Boost_INCLUDE_DIRS}
)

set(BOOST_COMPONENTS unit_test_framework timer serialization)
find_package( Boost COMPONENTS ${BOOST_COMPONENTS} REQUIRED )
find_package( LevelDB REQUIRED )

if (LKVS_BUILD_EXAMPLES)
    add_subdirectory(example)
endif()

if (LKVS_BUILD_TESTS)
    add_subdirectory(test)
endif()
