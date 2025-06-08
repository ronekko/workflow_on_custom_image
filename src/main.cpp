#include <filesystem>

#include <fmt/ostream.h>
#include <spdlog/spdlog.h>
#include <Eigen/Core>

int main()
{
    const std::filesystem::path path = "~/my_repo/parameters/app.toml";
    SPDLOG_INFO("{}", path);

    Eigen::Vector3d vec(1., 2., 3.);
    SPDLOG_INFO("[{}]", vec.transpose());

    return 0;
}
