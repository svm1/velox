# Copyright (c) Facebook, Inc. and its affiliates.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
include_guard(GLOBAL)

set(VELOX_CCTZ_VERSION 2.3)
# release artifacts are tough (except the auto generated ones)
set(VELOX_CCTZ_BUILD_SHA256_CHECKSUM 8615b20d4e33e02a271c3b93a3b208e3d7d5d66880f5f6208b03426e448f32db)
set(VELOX_CCTZ_SOURCE_URL "https://github.com/google/cctz/archive/refs/tags/v2.3.tar.gz") # ideally don't use github archive links as
                                   # they are not guranteed to be hash stable

resolve_dependency_url(CCTZ)

message(STATUS "Building cctz from source")
FetchContent_Declare(
  cctz
  URL ${VELOX_CCTZ_SOURCE_URL}
  URL_HASH ${VELOX_CCTZ_BUILD_SHA256_CHECKSUM})

set(BUILD_TOOLS OFF CACHE BOOL "Build libfoo shared library" FORCE)
set(BUILD_EXAMPLES OFF CACHE BOOL "Build libfoo shared library" FORCE)
set(BUILD_BENCHMARK OFF CACHE BOOL "Build libfoo shared library" FORCE)
set(BUILD_TESTING OFF CACHE BOOL "Build libfoo shared library" FORCE)

FetchContent_MakeAvailable(cctz)

# if(NOT cctz_POPULATED)
#   set(CMAKE_CXX_FLAGS_BKP "${CMAKE_CXX_FLAGS}")

#   # Disable warnings that would fail CCTZ compilation.
#   string(APPEND CMAKE_CXX_FLAGS " -Wno-missing-field-initializers")

#   check_cxx_compiler_flag("-Wstringop-overflow"
#                           COMPILER_HAS_W_STRINGOP_OVERFLOW)
#   if(COMPILER_HAS_W_STRINGOP_OVERFLOW)
#     string(APPEND CMAKE_CXX_FLAGS " -Wno-stringop-overflow")
#   endif()

#   check_cxx_compiler_flag("-Winvalid-noreturn" COMPILER_HAS_W_INVALID_NORETURN)

#   if(COMPILER_HAS_W_INVALID_NORETURN)
#     string(APPEND CMAKE_CXX_FLAGS " -Wno-invalid-noreturn")
#   else()
#     # Currently reproduced on Ubuntu 22.04 with clang 14
#     string(APPEND CMAKE_CXX_FLAGS " -Wno-error")
#   endif()

#   # Fetch the content using previously declared details
#   FetchContent_Populate(cctz)

#   # Set right path to libCCTZ include files.
#   set(CCTZ_INCLUDE_DIRS "${cctz_SOURCE_DIR}/src/")
# #   set(CCTZ_EXECUTABLE "${cctz_BINARY_DIR}/cctzc")
#   message(STATUS "cctz_SOURCE_DIR = ${cctz_SOURCE_DIR}")

#   set(CCTZ_LIBRARIES "${cctz_BINARY_DIR}/libcctz.a")
#   add_subdirectory(${cctz_SOURCE_DIR} ${cctz_BINARY_DIR})
#   set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS_BKP}")
# endif()
