# This is an autogenerated file. Do not edit

get_filename_component(_cur_dir ${CMAKE_CURRENT_LIST_FILE} PATH)
set(_root_dir "${_cur_dir}/../../../")
get_filename_component(ROOT_DIR ${_root_dir} ABSOLUTE)

 
set(QIPYTHON_INCLUDE_DIRS "${ROOT_DIR}/include;" CACHE STRING "" FORCE)
mark_as_advanced(QIPYTHON_INCLUDE_DIRS)
   
set(QIPYTHON_LIBRARIES
  ${ROOT_DIR}/lib/libqipython.so
  CACHE STRING "" FORCE)

mark_as_advanced(QIPYTHON_LIBRARIES)
 
set(QIPYTHON_PACKAGE_FOUND TRUE CACHE INTERNAL "" FORCE)
 
set(QIPYTHON_DEPENDS "BOOST_PYTHON;PYTHON;UTIL;QI;BOOST;BOOST_ATOMIC;BOOST_DATE_TIME;BOOST_FILESYSTEM;BOOST_REGEX;BOOST_PROGRAM_OPTIONS;OPENSSL;BOOST_LOCALE;BOOST_THREAD;BOOST_CHRONO;BOOST_SYSTEM;PTHREAD;DL;RT" CACHE INTERNAL "" FORCE)
 