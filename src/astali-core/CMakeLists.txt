# Copyright (c) 2026 Andrea Ballestrazzi
# SPDX-License-Identifier: MIT

set(ASTALI_CORE_TARGET astali-core)

set(ASTALI_CORE_SOURCE_FILES
  # TODO: Remove this
  placeholder.cpp
)
set(ASTALI_CORE_HEADER_FILES)

add_library(${ASTALI_CORE_TARGET} STATIC ${ASTALI_CORE_SOURCE_FILES} ${ASTALI_CORE_HEADER_FILES})
target_compile_features(${ASTALI_CORE_TARGET} PUBLIC cxx_std_${ASTALI_CXX_STANDARD})
target_include_directories(${ASTALI_CORE_TARGET} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
target_link_libraries(${ASTALI_CORE_TARGET} PRIVATE astali-warnings)
