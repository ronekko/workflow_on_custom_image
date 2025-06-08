cmake_minimum_required(VERSION 3.26)
project(my_project VERSION 0.0.0 LANGUAGES CXX)

# 有効化する警告を設定する。
set (ENABLED_WARNINGS
    -Werror
    -Wall
    -Wextra

    -Wcast-align
    -Wconversion
    -Wdelete-non-virtual-dtor
    -Wfloat-equal
    -Winit-self
    -Wlogical-op
    -Wmissing-include-dirs
    -Wredundant-decls
    -Wshadow
    -Wsign-promo
    -Wswitch-default
    -Wvla
)
# 無効化する警告を設定する。
set (DISABLED_WARNINGS
)

# CMAKE_BUILD_TYPE オプションのデフォルト値を Debug に設定する。
if (NOT CMAKE_BUILD_TYPE)
  message(STATUS "No build type selected, default to Debug")
  set(CMAKE_BUILD_TYPE "Debug" CACHE STRING "Build type (default Debug)")
  set_property(CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS "Debug" "Release" "RelWithDebInfo" "MinSizeRel")
endif()

# リンカを`lld`に設定する。
find_program(LLD_LINKER_FOUND lld)
if (NOT LLD_LINKER_FOUND)
    message(FATAL_ERROR "lldリンカが見つかりませんでした。次のコマンドでインストールしてください。 `sudo apt update && sudo apt install -y lld`")
endif()
unset(LLD_LINKER_FOUND)
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -fuse-ld=lld")
set(CMAKE_MODULE_LINKER_FLAGS "${CMAKE_MODULE_LINKER_FLAGS} -fuse-ld=lld")
set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} -fuse-ld=lld")

# ビルドで `ccache` を使う。
find_program(CCACHE_FOUND ccache)
if (NOT CCACHE_FOUND)
    message(FATAL_ERROR "ccacheが見つかりませんでした。次のコマンドでインストールしてください。 `sudo apt update && sudo apt install -y ccache`")
endif()
unset(CCACHE_FOUND)
set(CMAKE_C_COMPILER_LAUNCHER ccache)
set(CMAKE_CXX_COMPILER_LAUNCHER ccache)

# ソースコード。
add_subdirectory(src)
