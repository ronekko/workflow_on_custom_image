# docker build -t ubuntu22.04-cpp:latest .
# docker tag ubuntu22.04-cpp ghcr.io/ronekko/ubuntu22.04-cpp:latest
# docker push ghcr.io/ronekko/ubuntu22.04-cpp:latest

FROM ubuntu:22.04

# 基本的な環境変数設定
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt install -y sudo

# scriptsディレクトリ全体をコピー
COPY scripts/ /tmp/scripts/

# 環境構築を実行
RUN /tmp/scripts/install_dependencies.sh && \
    rm -rf /tmp/scripts/

WORKDIR /workspace
