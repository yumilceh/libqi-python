include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../../)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/..)

set(_headers
  ../qipython/api.hpp
  ../qipython/pyinit.hpp
  ../qipython/pyexport.hpp
  ../qipython/pyapplication.hpp
  ../qipython/pysession.hpp
  ../qipython/pyfuture.hpp
  ../qipython/pyobject.hpp
  ../qipython/pyproperty.hpp
  ../qipython/pythreadsafeobject.hpp
  ../qipython/pysignal.hpp
  ../qipython/pyasync.hpp
  ../qipython/pymodule.hpp
  ../qipython/pylog.hpp
  ../qipython/pypath.hpp
  ../qipython/pytranslator.hpp
  ../qipython/pyclock.hpp
  ../qipython/error.hpp
  ../qipython/gil.hpp
  ../qipython/trace.hpp
)

set(_sources
  ../src/pyobject_p.hpp
  ../src/pyinit.cpp
  ../src/pyexport.cpp
  ../src/pyapplication.cpp
  ../src/pysession.cpp
  ../src/pyfuture.cpp
  ../src/pyobject.cpp
  ../src/pyobjectconverter.cpp
  ../src/pyproperty.cpp
  ../src/pysignal.cpp
  ../src/pyasync.cpp
  ../src/pymodule.cpp
  ../src/pylog.cpp
  ../src/pypath.cpp
  ../src/pytranslator.cpp
  ../src/error.cpp
  ../src/trace.cpp
  ../src/pystrand.hpp
  ../src/pystrand.cpp
  ../src/pyclock.cpp
)

qi_install_header(${_headers} SUBFOLDER qipython)

message(STATUS "Generating libs for python${pyver}")


qi_create_lib(qipython${pyver} SHARED
  ${_headers}
  ${_sources}
)

qi_use_lib(qipython${pyver} BOOST_PYTHON${pyver} PYTHON${pyver} QI)

qi_stage_lib(qipython${pyver})

qi_install_python(${CMAKE_CURRENT_SOURCE_DIR}/../qi VERSION ${pyver} KEEP_RELATIVE_PATHS)

if("${pyver}" STREQUAL "")
  qi_create_python_ext(_qi ../src/boostpymain.cpp)
  qi_install_python(${CMAKE_CURRENT_SOURCE_DIR}/../qi KEEP_RELATIVE_PATHS)
  qi_use_lib(_qi qipython)
  # Hack for embedded python interpreter to find the sources of
  # pure python 'qi' library. (It uses qi::path::librariesPath())
  add_custom_target(copy-python-qi ALL
    COMMAND ${CMAKE_COMMAND}
    -E copy_directory
    "${CMAKE_SOURCE_DIR}/qi"
    "${QI_SDK_DIR}/${QI_SDK_LIB}/qi"
  )
else()
  # Hack until qibuild fully supports python3
  add_library(_qi3 SHARED ../src/boostpymain.cpp)
  if(UNIX)
    set_target_properties(_qi3
      PROPERTIES
      SUFFIX ".so"
      )
  endif()
  set_target_properties(_qi3
      PROPERTIES PREFIX ""
      OUTPUT_NAME "_qi"
      LIBRARY_OUTPUT_DIRECTORY
        "${QI_SDK_DIR}/${QI_SDK_LIB}/python3.4/site-packages"
  )
  qi_use_lib(_qi3 qipython3)
endif()

add_subdirectory(../testspy ${CMAKE_CURRENT_BINARY_DIR}/testspy)
