# Copyright (c) 2026 Andrea Ballestrazzi
# SPDX-License-Identifier: MIT

set(ASTALI_APP_TARGET Astali)

set(ASTALI_APP_SOURCE_FILES main.cpp)
set(ASTALI_APP_HEADER_FILES)

if(WIN32)
  set(ASTALI_APP_SUBSYSTEM WIN32)
else()
  set(ASTALI_APP_SUBSYSTEM)
endif()

add_executable(${ASTALI_APP_TARGET} ${ASTALI_APP_SUBSYSTEM} ${ASTALI_APP_SOURCE_FILES} ${ASTALI_APP_HEADER_FILES})
target_link_libraries(${ASTALI_APP_TARGET} PRIVATE astali-core astali-warnings)
target_include_directories(${ASTALI_APP_TARGET} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
