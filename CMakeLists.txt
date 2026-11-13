# Copyright (c) 2026 Andrea Ballestrazzi
# SPDX-License-Identifier: MIT
cmake_minimum_required(VERSION 3.24)

project(Astali
  VERSION 1.0.0
  DESCRIPTION "Astali App, but rewritten in C++ with no AI"
  LANGUAGES CXX
)

# === Options ===
option(ASTALI_BUILD_TESTS "Build Astali test suite" ${PROJECT_IS_TOP_LEVEL})
option(ASTALI_WARNINGS_AS_ERRORS "Compiler warnings are treated as errors" OFF)
option(ASTALI_USE_UNICODE "Build with Unicode support" ON)
# ===============

# === Language ===
set(ASTALI_CXX_STANDARD 23 CACHE STRING "C++ standard used to build Astali")
set(CMAKE_CXX_STANDARD ${ASTALI_CXX_STANDARD})
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
# ================

# === Directories ===
set(ASTALI_SRC_REL_FOLDER src)
set(ASTALI_TESTS_REL_FOLDER tests)
set(ASTALI_BIN_ABS_FOLDER ${CMAKE_SOURCE_DIR}/bin)
set(ASTALI_LIB_ABS_FOLDER ${CMAKE_SOURCE_DIR}/lib)
# ===================

# === Output configuration ===
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${ASTALI_BIN_ABS_FOLDER}")
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${ASTALI_LIB_ABS_FOLDER}")
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${ASTALI_LIB_ABS_FOLDER}")
# ============================

add_subdirectory(${ASTALI_SRC_REL_FOLDER})

if(ASTALI_BUILD_TESTS)
  add_subdirectory(${ASTALI_TESTS_REL_FOLDER})
endif()
