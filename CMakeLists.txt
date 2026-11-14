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
# ===============

# === Language ===
set(ASTALI_CXX_STANDARD 23 CACHE STRING "C++ standard used to build Astali")
set_property(CACHE ASTALI_CXX_STANDARD PROPERTY STRINGS 23 26)
set(CMAKE_CXX_EXTENSIONS OFF)
# ================

# === Directories ===
set(ASTALI_SRC_REL_FOLDER src)
set(ASTALI_TESTS_REL_FOLDER tests)
set(ASTALI_BIN_ABS_FOLDER ${PROJECT_SOURCE_DIR}/bin)
set(ASTALI_LIB_ABS_FOLDER ${PROJECT_SOURCE_DIR}/lib)
# ===================

# === Output configuration ===
# Only when Astali is the top-level project: when embedded, the parent decides
# where binaries go and whether to export compile commands.
if(PROJECT_IS_TOP_LEVEL)
  set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

  # $<CONFIG> gives every generator the same layout (bin/<Config>/), so Debug and
  # Release builds never overwrite each other. Multi-config generators would
  # otherwise append the config folder on their own, while single-config ones don't.
  set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${ASTALI_BIN_ABS_FOLDER}/$<CONFIG>")
  set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${ASTALI_LIB_ABS_FOLDER}/$<CONFIG>")
  set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${ASTALI_LIB_ABS_FOLDER}/$<CONFIG>")
endif()
# ============================

# === Warnings ===
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")
include(AstaliWarnings)
# ================

add_subdirectory(${ASTALI_SRC_REL_FOLDER})

if(ASTALI_BUILD_TESTS)
  add_subdirectory(${ASTALI_TESTS_REL_FOLDER})
endif()
