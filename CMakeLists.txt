cmake_minimum_required(VERSION 3.16)
project(cpp-template VERSION 0.1.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS ON)

add_compile_options("-Ofast")

string(APPEND CMAKE_CXX_FLAGS
      " -Wall -Wextra -Wpedantic -Wconversion -Wsign-conversion -Wcast-qual -Wformat=2"
      " -Wundef -Wshadow -Wcast-align -Wunused -Wnull-dereference"
      " -Wdouble-promotion -Wimplicit-fallthrough -Wextra-semi -Woverloaded-virtual"
      " -Wnon-virtual-dtor -Wold-style-cast")

string(APPEND CMAKE_CXX_FLAGS_DEBUG " -fsanitize=address,undefined -fno-omit-frame-pointer")
string(APPEND CMAKE_EXE_LINKER_FLAGS_DEBUG " -fsanitize=address,undefined -fno-omit-frame-pointer")

list(APPEND CMAKE_CTEST_ARGUMENTS "--output-on-failure")

add_executable(exec src/main.cpp src/team.cpp)

if (BUILD_TESTING)
      add_executable(test tests/test.cpp src/team.cpp)
      target_include_directories(test PRIVATE src include)
      add_test(NAME test COMMAND test)
endif()
