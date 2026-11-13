# Copyright (c) 2026 Andrea Ballestrazzi
# SPDX-License-Identifier: MIT

set(ASTALI_CORE_TARGET astali-core-tests)

set(ASTALI_CORE_TESTS_SOURCE_FILES
  placeholder.tests.cpp
)

# TODO: Replace with executable once Catch2 is in
add_library(${ASTALI_CORE_TARGET} STATIC ${ASTALI_CORE_TESTS_SOURCE_FILES})
target_link_libraries(${ASTALI_CORE_TARGET} PRIVATE astali-core)
