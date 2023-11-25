cmake_minimum_required(VERSION 3.13)
project(ParaCL)

find_package(BISON REQUIRED)
find_package(FLEX REQUIRED)

flex_target (lexer  lexer.l  ${CMAKE_CURRENT_BINARY_DIR}/lexer.cc)
bison_target(parser parser.y ${CMAKE_CURRENT_BINARY_DIR}/parser.cc DEFINES_FILE ${CMAKE_CURRENT_BINARY_DIR}/parser.hpp)

add_flex_bison_dependency(lexer parser)

add_executable(${PROJECT_NAME} main.cc ${BISON_parser_OUTPUTS} ${FLEX_lexer_OUTPUTS})

target_compile_features(${PROJECT_NAME} PRIVATE cxx_std_20)
target_include_directories(${PROJECT_NAME} PRIVATE ${CMAKE_CURRENT_BINARY_DIR})
target_include_directories(${PROJECT_NAME} PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})