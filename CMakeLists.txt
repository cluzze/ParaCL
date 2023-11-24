cmake_minimum_required(VERSION 3.13)
project(ParaCL)

find_package(FLEX REQUIRED)

flex_target(lexer lexer.l ${CMAKE_CURRENT_BINARY_DIR}/lexer.cc)

add_executable(${PROJECT_NAME} main.cc ${FLEX_lexer_OUTPUTS})

target_compile_features(${PROJECT_NAME} PRIVATE cxx_std_20)
target_include_directories(${PROJECT_NAME} PRIVATE ${CMAKE_CURRENT_BINARY_DIR})
target_include_directories(${PROJECT_NAME} PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})