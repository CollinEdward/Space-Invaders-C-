# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.27

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /opt/homebrew/Cellar/cmake/3.27.7/bin/cmake

# The command to remove a file.
RM = /opt/homebrew/Cellar/cmake/3.27.7/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = "/Users/mbn/Documents/Programmering/Cpp Game"

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = "/Users/mbn/Documents/Programmering/Cpp Game/build"

# Include any dependencies generated for this target.
include CMakeFiles/MySFMLGame.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/MySFMLGame.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/MySFMLGame.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/MySFMLGame.dir/flags.make

CMakeFiles/MySFMLGame.dir/main.cpp.o: CMakeFiles/MySFMLGame.dir/flags.make
CMakeFiles/MySFMLGame.dir/main.cpp.o: /Users/mbn/Documents/Programmering/Cpp\ Game/main.cpp
CMakeFiles/MySFMLGame.dir/main.cpp.o: CMakeFiles/MySFMLGame.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir="/Users/mbn/Documents/Programmering/Cpp Game/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/MySFMLGame.dir/main.cpp.o"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/MySFMLGame.dir/main.cpp.o -MF CMakeFiles/MySFMLGame.dir/main.cpp.o.d -o CMakeFiles/MySFMLGame.dir/main.cpp.o -c "/Users/mbn/Documents/Programmering/Cpp Game/main.cpp"

CMakeFiles/MySFMLGame.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/MySFMLGame.dir/main.cpp.i"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/Users/mbn/Documents/Programmering/Cpp Game/main.cpp" > CMakeFiles/MySFMLGame.dir/main.cpp.i

CMakeFiles/MySFMLGame.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/MySFMLGame.dir/main.cpp.s"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/Users/mbn/Documents/Programmering/Cpp Game/main.cpp" -o CMakeFiles/MySFMLGame.dir/main.cpp.s

# Object files for target MySFMLGame
MySFMLGame_OBJECTS = \
"CMakeFiles/MySFMLGame.dir/main.cpp.o"

# External object files for target MySFMLGame
MySFMLGame_EXTERNAL_OBJECTS =

MySFMLGame: CMakeFiles/MySFMLGame.dir/main.cpp.o
MySFMLGame: CMakeFiles/MySFMLGame.dir/build.make
MySFMLGame: /opt/homebrew/lib/libsfml-graphics.2.6.1.dylib
MySFMLGame: /opt/homebrew/lib/libsfml-audio.2.6.1.dylib
MySFMLGame: /opt/homebrew/lib/libsfml-window.2.6.1.dylib
MySFMLGame: /opt/homebrew/lib/libsfml-system.2.6.1.dylib
MySFMLGame: CMakeFiles/MySFMLGame.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir="/Users/mbn/Documents/Programmering/Cpp Game/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable MySFMLGame"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/MySFMLGame.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/MySFMLGame.dir/build: MySFMLGame
.PHONY : CMakeFiles/MySFMLGame.dir/build

CMakeFiles/MySFMLGame.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/MySFMLGame.dir/cmake_clean.cmake
.PHONY : CMakeFiles/MySFMLGame.dir/clean

CMakeFiles/MySFMLGame.dir/depend:
	cd "/Users/mbn/Documents/Programmering/Cpp Game/build" && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" "/Users/mbn/Documents/Programmering/Cpp Game" "/Users/mbn/Documents/Programmering/Cpp Game" "/Users/mbn/Documents/Programmering/Cpp Game/build" "/Users/mbn/Documents/Programmering/Cpp Game/build" "/Users/mbn/Documents/Programmering/Cpp Game/build/CMakeFiles/MySFMLGame.dir/DependInfo.cmake" "--color=$(COLOR)"
.PHONY : CMakeFiles/MySFMLGame.dir/depend
