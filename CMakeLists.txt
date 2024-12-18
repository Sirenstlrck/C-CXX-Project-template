cmake_minimum_required(VERSION 3.15)

set_property(GLOBAL PROPERTY USE_FOLDERS ON)

project(CppProjectTemplate)

set(PROJECT_SRC_DIR ${CMAKE_CURRENT_SOURCE_DIR}/src/project)
add_executable(${PROJECT_NAME}
    ${PROJECT_SRC_DIR}/Main.cpp)

find_package(GTest)
if(GTest_FOUND)
    set(TESTS_SRC_DIR ${CMAKE_CURRENT_SOURCE_DIR}/src/tests)
    set(TESTS_PROJECT_NAME ${PROJECT_NAME}Tests)
    add_executable(${TESTS_PROJECT_NAME}
        ${TESTS_SRC_DIR}/Foo.cpp)
    target_link_libraries(${TESTS_PROJECT_NAME} PRIVATE gtest::gtest)
else()
    message(WARNING "Failed to fing GTest!")
endif()

set_property(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} PROPERTY VS_STARTUP_PROJECT ${PROJECT_NAME})

include(DummyProject.cmake)
set(RESOURCES ./conanfile.txt ./src/.clang-format ./.gitignore)
add_dummy_project(Environment)
dummy_project_add_filter(Environment "Resources" "${RESOURCES}")
file(GLOB BUILD_SCRIPTS ./scripts/*)
dummy_project_add_filter(Environment "BuildScripts" "${BUILD_SCRIPTS}")
