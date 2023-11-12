cmake_minimum_required(VERSION 3.0)

project(MySFMLGame)

find_package(SFML 2.6.1 COMPONENTS graphics audio REQUIRED)

add_executable(MySFMLGame main.cpp)

target_link_libraries(MySFMLGame sfml-graphics sfml-audio)