# Copyright (c) 2026 Andrea Ballestrazzi
# SPDX-License-Identifier: MIT

# Warning flags for Astali targets. Link `astali-warnings` PRIVATE into each target,
# so the flags never leak into third-party dependencies.

include_guard(GLOBAL)

add_library(astali-warnings INTERFACE)

# Scoped to this interface target (not CMAKE_COMPILE_WARNING_AS_ERROR), so
# warnings in third-party dependencies never fail the build.
if(ASTALI_WARNINGS_AS_ERRORS)
  if(MSVC)
    target_compile_options(astali-warnings INTERFACE /WX)
  else()
    target_compile_options(astali-warnings INTERFACE -Werror)
  endif()
endif()

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
