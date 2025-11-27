# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION ${CMAKE_VERSION}) # this file comes with cmake

# If CMAKE_DISABLE_SOURCE_CHANGES is set to true and the source directory is an
# existing directory in our source tree, calling file(MAKE_DIRECTORY) on it
# would cause a fatal error, even though it would be a no-op.
if(NOT EXISTS "/home/runner/work/BennuGD_libretro/BennuGD_libretro/_codeql_build_dir/_deps/libressl-src")
  file(MAKE_DIRECTORY "/home/runner/work/BennuGD_libretro/BennuGD_libretro/_codeql_build_dir/_deps/libressl-src")
endif()
file(MAKE_DIRECTORY
  "/home/runner/work/BennuGD_libretro/BennuGD_libretro/_codeql_build_dir/_deps/libressl-build"
  "/home/runner/work/BennuGD_libretro/BennuGD_libretro/_codeql_build_dir/_deps/libressl-subbuild/libressl-populate-prefix"
  "/home/runner/work/BennuGD_libretro/BennuGD_libretro/_codeql_build_dir/_deps/libressl-subbuild/libressl-populate-prefix/tmp"
  "/home/runner/work/BennuGD_libretro/BennuGD_libretro/_codeql_build_dir/_deps/libressl-subbuild/libressl-populate-prefix/src/libressl-populate-stamp"
  "/home/runner/work/BennuGD_libretro/BennuGD_libretro/_codeql_build_dir/_deps/libressl-subbuild/libressl-populate-prefix/src"
  "/home/runner/work/BennuGD_libretro/BennuGD_libretro/_codeql_build_dir/_deps/libressl-subbuild/libressl-populate-prefix/src/libressl-populate-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "/home/runner/work/BennuGD_libretro/BennuGD_libretro/_codeql_build_dir/_deps/libressl-subbuild/libressl-populate-prefix/src/libressl-populate-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "/home/runner/work/BennuGD_libretro/BennuGD_libretro/_codeql_build_dir/_deps/libressl-subbuild/libressl-populate-prefix/src/libressl-populate-stamp${cfgdir}") # cfgdir has leading slash
endif()
