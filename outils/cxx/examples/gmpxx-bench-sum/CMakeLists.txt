project(GMPXX_BENCH_SUM)
cmake_minimum_required(VERSION 3.1)

find_package(Boost COMPONENTS timer REQUIRED)

# missing finder -> hardcoded link with gmp
# (https://github.com/CGAL/cgal/blob/master/Installation/cmake/modules/FindGMP.cmake)
#find_package(GMP REQUIRED)
#include_directories(${GMP_INCLUDE_DIRS})

add_executable( gmpxx-bench-sum main.cpp )
target_link_libraries( gmpxx-bench-sum
	gmp
	${Boost_LIBRARIES}
)

