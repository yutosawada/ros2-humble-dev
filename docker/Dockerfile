FROM osrf/ros:humble-desktop

# yq v4 をインストール（YAMLファイル解析に必要）
RUN apt-get update && apt-get install -y wget && \
    wget -qO /usr/local/bin/yq https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 && \
    chmod +x /usr/local/bin/yq && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# 必要なツールと依存関係をインストール
COPY clone_repos_config.yaml /tmp/clone_repos_config.yaml
COPY docker/scripts/install_packages.sh /tmp/install_packages.sh
RUN bash /tmp/install_packages.sh /tmp/clone_repos_config.yaml apt_packages.builder && \
    locale-gen en_US.UTF-8 && \
    update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 && \
    rm -f /tmp/install_packages.sh /tmp/clone_repos_config.yaml && \
    rm -rf /var/lib/apt/lists/*

# ROS 2 のセットアップを自動で source
RUN echo "source /opt/ros/humble/setup.bash" >> /root/.bashrc

WORKDIR /ros2_ws
CMD ["bash"]
