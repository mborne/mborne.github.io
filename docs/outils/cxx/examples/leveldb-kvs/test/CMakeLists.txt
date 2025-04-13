file(GLOB_RECURSE TEST_SOURCES "${CMAKE_SOURCE_DIR}/test/*.cpp")

ADD_DEFINITIONS(-DBOOST_TEST_DYN_LINK)

add_executable( lkvs-test
    ${TEST_SOURCES}
)
target_link_libraries(lkvs-test
    ${LevelDB_LIBRARIES}
    ${Boost_LIBRARIES}
)
