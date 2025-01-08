cmake_minimum_required(VERSION 3.19)
project(Rivershell LANGUAGES C CXX VERSION 0.0.1)

add_subdirectory(sdk)

add_library(${PROJECT_NAME} SHARED main.cpp)

target_link_libraries(${PROJECT_NAME} PRIVATE
    OMP-SDK
)

set_property(TARGET ${PROJECT_NAME} PROPERTY PREFIX "")
