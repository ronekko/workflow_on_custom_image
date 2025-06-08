add_executable(main main.cpp)

# 警告の有効化と無効化を設定する。
target_compile_options(main PRIVATE ${ENABLED_WARNINGS})
target_compile_options(main PRIVATE ${DISABLED_WARNINGS})

# コンパイルフィーチャーを設定する。
target_compile_features(main PRIVATE cxx_std_20)

find_package(fmt REQUIRED)
target_link_libraries(main PRIVATE fmt::fmt)

find_package(spdlog REQUIRED)
target_link_libraries(main PRIVATE spdlog::spdlog)

find_package(Eigen3 REQUIRED)
target_link_libraries(main PRIVATE Eigen3::Eigen)

# spdlogの SPDLOG_ACTIVE_LEVEL を SPDLOG_LEVEL_TRACE に設定する。
target_compile_definitions(main PRIVATE SPDLOG_ACTIVE_LEVEL=0)
