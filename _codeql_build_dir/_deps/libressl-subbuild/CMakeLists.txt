# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.31.6)

# Reject any attempt to use a toolchain file. We must not use one because
# we could be downloading it here. If the CMAKE_TOOLCHAIN_FILE environment
# variable is set, the cache variable will have been initialized from it.
unset(CMAKE_TOOLCHAIN_FILE CACHE)
unset(ENV{CMAKE_TOOLCHAIN_FILE})

# We name the project and the target for the ExternalProject_Add() call
# to something that will highlight to the user what we are working on if
# something goes wrong and an error message is produced.

project(libressl-populate NONE)



include(ExternalProject)
ExternalProject_Add(libressl-populate
                     "UPDATE_DISCONNECTED" "False" "DOWNLOAD_EXTRACT_TIMESTAMP" "FALSE" "EXTERNALPROJECT_INTERNAL_ARGUMENT_SEPARATOR" "URL" "https://github.com/libressl/portable/releases/download/v3.9.2/libressl-3.9.2.tar.gz" "URL_HASH" "SHA256=7b031dac64a59eb6ee3304f7ffb75dad33ab8c9d279c847f92c89fb846068f97"
                    SOURCE_DIR          "/home/runner/work/BennuGD_libretro/BennuGD_libretro/_codeql_build_dir/_deps/libressl-src"
                    BINARY_DIR          "/home/runner/work/BennuGD_libretro/BennuGD_libretro/_codeql_build_dir/_deps/libressl-build"
                    CONFIGURE_COMMAND   ""
                    BUILD_COMMAND       ""
                    INSTALL_COMMAND     ""
                    TEST_COMMAND        ""
                    USES_TERMINAL_DOWNLOAD  YES
                    USES_TERMINAL_UPDATE    YES
                    USES_TERMINAL_PATCH     YES
)


