cmake_minimum_required (VERSION 3.0)
project (EIGEN_SPARSE_SOLVE)
 
find_package (Eigen3 3.3 REQUIRED NO_MODULE)
 
add_executable (eigen-sparse-solve main.cpp)
target_link_libraries (eigen-sparse-solve Eigen3::Eigen)

