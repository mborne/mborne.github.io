project( HelloPython )
cmake_minimum_required( VERSION 2.8 )

# Find Boost
find_package(Boost COMPONENTS python REQUIRED)

# Find Python
find_package(PythonInterp EXACT 3.10 REQUIRED)
find_package(PythonLibs EXACT 3.10 REQUIRED)

include_directories( ${PYTHON_INCLUDE_DIRS} )

add_library(hello SHARED hello.cpp)
target_link_libraries( hello
	${Boost_LIBRARIES}
)
set_target_properties(hello PROPERTIES PREFIX "")

install( TARGETS hello DESTINATION ${CMAKE_SOURCE_DIR}/demo )

