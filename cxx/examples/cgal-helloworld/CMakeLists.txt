project(CGAL_HELLOWORLD)
cmake_minimum_required(VERSION 3.1)

find_package(CGAL REQUIRED)

include_directories(${CGAL_INCLUDE_DIRS})

message(STATUS "CGAL_INCLUDE_DIRS :  ${CGAL_INCLUDE_DIRS}")
message(STATUS "CGAL_VERSION :  ${CGAL_VERSION}")

add_executable( cgal-helloworld main.cpp )
target_link_libraries( cgal-helloworld
	${CGAL_LIBRARIES}
)

