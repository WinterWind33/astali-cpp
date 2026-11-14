# Copyright (c) 2026 Andrea Ballestrazzi
# SPDX-License-Identifier: MIT

# Warning flags for Astali targets. Link `astali-warnings` PRIVATE into each target,
# so the flags never leak into third-party dependencies.

include_guard(GLOBAL)

set(CMAKE_COMPILE_WARNING_AS_ERROR ${ASTALI_WARNINGS_AS_ERRORS})

add_library(astali-warnings INTERFACE)

if(MSVC) # MSVC and clang-cl
  target_compile_options(astali-warnings INTERFACE /W4)
else() # GCC, Clang, AppleClang
  target_compile_options(astali-warnings INTERFACE
    -Wall
    -Wextra
    -Wpedantic
    -Wshadow
    -Wconversion
    -Wsign-conversion
    -Wold-style-cast
    -Wnon-virtual-dtor
    -Woverloaded-virtual
  )
endif()
