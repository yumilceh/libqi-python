# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/juan/pepper_ws/libqi-python

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/juan/pepper_ws/libqi-python/BUILD

# Include any dependencies generated for this target.
include python2/CMakeFiles/_qi.dir/depend.make

# Include the progress variables for this target.
include python2/CMakeFiles/_qi.dir/progress.make

# Include the compile flags for this target's objects.
include python2/CMakeFiles/_qi.dir/flags.make

python2/CMakeFiles/_qi.dir/__/src/boostpymain.cpp.o: python2/CMakeFiles/_qi.dir/flags.make
python2/CMakeFiles/_qi.dir/__/src/boostpymain.cpp.o: ../src/boostpymain.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/juan/pepper_ws/libqi-python/BUILD/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object python2/CMakeFiles/_qi.dir/__/src/boostpymain.cpp.o"
	cd /home/juan/pepper_ws/libqi-python/BUILD/python2 && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/_qi.dir/__/src/boostpymain.cpp.o -c /home/juan/pepper_ws/libqi-python/src/boostpymain.cpp

python2/CMakeFiles/_qi.dir/__/src/boostpymain.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/_qi.dir/__/src/boostpymain.cpp.i"
	cd /home/juan/pepper_ws/libqi-python/BUILD/python2 && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/juan/pepper_ws/libqi-python/src/boostpymain.cpp > CMakeFiles/_qi.dir/__/src/boostpymain.cpp.i

python2/CMakeFiles/_qi.dir/__/src/boostpymain.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/_qi.dir/__/src/boostpymain.cpp.s"
	cd /home/juan/pepper_ws/libqi-python/BUILD/python2 && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/juan/pepper_ws/libqi-python/src/boostpymain.cpp -o CMakeFiles/_qi.dir/__/src/boostpymain.cpp.s

python2/CMakeFiles/_qi.dir/__/src/boostpymain.cpp.o.requires:

.PHONY : python2/CMakeFiles/_qi.dir/__/src/boostpymain.cpp.o.requires

python2/CMakeFiles/_qi.dir/__/src/boostpymain.cpp.o.provides: python2/CMakeFiles/_qi.dir/__/src/boostpymain.cpp.o.requires
	$(MAKE) -f python2/CMakeFiles/_qi.dir/build.make python2/CMakeFiles/_qi.dir/__/src/boostpymain.cpp.o.provides.build
.PHONY : python2/CMakeFiles/_qi.dir/__/src/boostpymain.cpp.o.provides

python2/CMakeFiles/_qi.dir/__/src/boostpymain.cpp.o.provides.build: python2/CMakeFiles/_qi.dir/__/src/boostpymain.cpp.o


# Object files for target _qi
_qi_OBJECTS = \
"CMakeFiles/_qi.dir/__/src/boostpymain.cpp.o"

# External object files for target _qi
_qi_EXTERNAL_OBJECTS =

sdk/lib/python2.7/site-packages/_qi.so: python2/CMakeFiles/_qi.dir/__/src/boostpymain.cpp.o
sdk/lib/python2.7/site-packages/_qi.so: python2/CMakeFiles/_qi.dir/build.make
sdk/lib/python2.7/site-packages/_qi.so: /usr/lib/x86_64-linux-gnu/libpython2.7.so
sdk/lib/python2.7/site-packages/_qi.so: /usr/lib/x86_64-linux-gnu/libdl.so
sdk/lib/python2.7/site-packages/_qi.so: /usr/lib/x86_64-linux-gnu/libutil.so
sdk/lib/python2.7/site-packages/_qi.so: sdk/lib/libqipython.so
sdk/lib/python2.7/site-packages/_qi.so: /home/juan/boost_1_59_0/stage/lib/libboost_python.so
sdk/lib/python2.7/site-packages/_qi.so: /usr/lib/x86_64-linux-gnu/libpython2.7.so
sdk/lib/python2.7/site-packages/_qi.so: /usr/lib/x86_64-linux-gnu/libutil.so
sdk/lib/python2.7/site-packages/_qi.so: /home/juan/pepper_ws/libqi/BUILD/output/lib/libqi.so
sdk/lib/python2.7/site-packages/_qi.so: /home/juan/boost_1_59_0/stage/lib/libboost_atomic.so
sdk/lib/python2.7/site-packages/_qi.so: /home/juan/boost_1_59_0/stage/lib/libboost_date_time.so
sdk/lib/python2.7/site-packages/_qi.so: /home/juan/boost_1_59_0/stage/lib/libboost_filesystem.so
sdk/lib/python2.7/site-packages/_qi.so: /home/juan/boost_1_59_0/stage/lib/libboost_system.so
sdk/lib/python2.7/site-packages/_qi.so: /home/juan/boost_1_59_0/stage/lib/libboost_regex.so
sdk/lib/python2.7/site-packages/_qi.so: /home/juan/boost_1_59_0/stage/lib/libboost_program_options.so
sdk/lib/python2.7/site-packages/_qi.so: /usr/lib/x86_64-linux-gnu/libssl.so
sdk/lib/python2.7/site-packages/_qi.so: /usr/lib/x86_64-linux-gnu/libcrypto.so
sdk/lib/python2.7/site-packages/_qi.so: /home/juan/boost_1_59_0/stage/lib/libboost_locale.so
sdk/lib/python2.7/site-packages/_qi.so: /home/juan/boost_1_59_0/stage/lib/libboost_thread.so
sdk/lib/python2.7/site-packages/_qi.so: /home/juan/boost_1_59_0/stage/lib/libboost_chrono.so
sdk/lib/python2.7/site-packages/_qi.so: /home/juan/boost_1_59_0/stage/lib/libboost_system.so
sdk/lib/python2.7/site-packages/_qi.so: /home/juan/boost_1_59_0/stage/lib/libboost_date_time.so
sdk/lib/python2.7/site-packages/_qi.so: /home/juan/boost_1_59_0/stage/lib/libboost_atomic.so
sdk/lib/python2.7/site-packages/_qi.so: /usr/lib/x86_64-linux-gnu/libpthread.so
sdk/lib/python2.7/site-packages/_qi.so: /home/juan/boost_1_59_0/stage/lib/libboost_chrono.so
sdk/lib/python2.7/site-packages/_qi.so: /home/juan/boost_1_59_0/stage/lib/libboost_system.so
sdk/lib/python2.7/site-packages/_qi.so: /home/juan/boost_1_59_0/stage/lib/libboost_system.so
sdk/lib/python2.7/site-packages/_qi.so: /usr/lib/x86_64-linux-gnu/libdl.so
sdk/lib/python2.7/site-packages/_qi.so: /usr/lib/x86_64-linux-gnu/librt.so
sdk/lib/python2.7/site-packages/_qi.so: /usr/lib/x86_64-linux-gnu/libpython2.7.so
sdk/lib/python2.7/site-packages/_qi.so: /usr/lib/x86_64-linux-gnu/libutil.so
sdk/lib/python2.7/site-packages/_qi.so: sdk/lib/libqipython.so
sdk/lib/python2.7/site-packages/_qi.so: /home/juan/boost_1_59_0/stage/lib/libboost_python.so
sdk/lib/python2.7/site-packages/_qi.so: /home/juan/pepper_ws/libqi/BUILD/output/lib/libqi.so
sdk/lib/python2.7/site-packages/_qi.so: /home/juan/boost_1_59_0/stage/lib/libboost_atomic.so
sdk/lib/python2.7/site-packages/_qi.so: /home/juan/boost_1_59_0/stage/lib/libboost_date_time.so
sdk/lib/python2.7/site-packages/_qi.so: /home/juan/boost_1_59_0/stage/lib/libboost_filesystem.so
sdk/lib/python2.7/site-packages/_qi.so: /home/juan/boost_1_59_0/stage/lib/libboost_regex.so
sdk/lib/python2.7/site-packages/_qi.so: /home/juan/boost_1_59_0/stage/lib/libboost_program_options.so
sdk/lib/python2.7/site-packages/_qi.so: /usr/lib/x86_64-linux-gnu/libssl.so
sdk/lib/python2.7/site-packages/_qi.so: /usr/lib/x86_64-linux-gnu/libcrypto.so
sdk/lib/python2.7/site-packages/_qi.so: /home/juan/boost_1_59_0/stage/lib/libboost_locale.so
sdk/lib/python2.7/site-packages/_qi.so: /home/juan/boost_1_59_0/stage/lib/libboost_thread.so
sdk/lib/python2.7/site-packages/_qi.so: /usr/lib/x86_64-linux-gnu/libpthread.so
sdk/lib/python2.7/site-packages/_qi.so: /usr/lib/x86_64-linux-gnu/librt.so
sdk/lib/python2.7/site-packages/_qi.so: python2/CMakeFiles/_qi.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/juan/pepper_ws/libqi-python/BUILD/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX shared library ../sdk/lib/python2.7/site-packages/_qi.so"
	cd /home/juan/pepper_ws/libqi-python/BUILD/python2 && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/_qi.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
python2/CMakeFiles/_qi.dir/build: sdk/lib/python2.7/site-packages/_qi.so

.PHONY : python2/CMakeFiles/_qi.dir/build

python2/CMakeFiles/_qi.dir/requires: python2/CMakeFiles/_qi.dir/__/src/boostpymain.cpp.o.requires

.PHONY : python2/CMakeFiles/_qi.dir/requires

python2/CMakeFiles/_qi.dir/clean:
	cd /home/juan/pepper_ws/libqi-python/BUILD/python2 && $(CMAKE_COMMAND) -P CMakeFiles/_qi.dir/cmake_clean.cmake
.PHONY : python2/CMakeFiles/_qi.dir/clean

python2/CMakeFiles/_qi.dir/depend:
	cd /home/juan/pepper_ws/libqi-python/BUILD && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/juan/pepper_ws/libqi-python /home/juan/pepper_ws/libqi-python/py2py3 /home/juan/pepper_ws/libqi-python/BUILD /home/juan/pepper_ws/libqi-python/BUILD/python2 /home/juan/pepper_ws/libqi-python/BUILD/python2/CMakeFiles/_qi.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : python2/CMakeFiles/_qi.dir/depend

