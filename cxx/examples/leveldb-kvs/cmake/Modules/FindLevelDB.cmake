# Look for the header file.
find_path(LevelDB_INCLUDE_DIR NAMES leveldb/db.h
    PATHS $ENV{CMAKE_WORKSPACE_DIR}
    PATH_SUFFIXES include
)
mark_as_advanced(LevelDB_INCLUDE_DIR)

# Look for the library
find_library(LevelDB_LIBRARY NAMES leveldb
    PATHS $ENV{CMAKE_WORKSPACE_DIR}
    PATH_SUFFIXES lib
)
mark_as_advanced(LevelDB_LIBRARY)

# handle the QUIETLY and REQUIRED arguments and set LevelDB_FOUND to TRUE if
# all listed variables are TRUE
include(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(LevelDB
  REQUIRED_VARS LevelDB_LIBRARY LevelDB_INCLUDE_DIR
  VERSION_VAR LevelDB_VERSION_STRING
)

set(LevelDB_LIBRARIES ${LevelDB_LIBRARY})
set(LevelDB_INCLUDE_DIRS ${LevelDB_INCLUDE_DIR})
