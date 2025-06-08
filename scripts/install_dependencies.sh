sudo apt-get update
sudo apt-get install -y \
    curl \
    git \
    build-essential \
    cmake \
    lld \
    ccache \
    libboost-dev \
    libfmt-dev \
    libspdlog-dev \
    libeigen3-dev \
    libopencv-dev \
    libssl-dev \
    libomp-dev \
    libdw-dev \
    doxygen \
    graphviz \
    libboost-program-options-dev \
    libboost-system-dev \
    libboost-thread-dev \
    software-properties-common \
    python3-pip \
    python3-psutil \
    vlc \
    clang-format

# aptのcmakeはバージョンが古いので、pipで配布されている新しいバージョンをインストールする。
sudo pip install cmake==3.26.3
