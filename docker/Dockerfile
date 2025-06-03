FROM ros:humble

# 必要パッケージを一括インストール
RUN apt-get update && apt-get install -y \
    python3-colcon-common-extensions \
    vim \
    can-utils \
    ros-humble-can-msgs \
    && rm -rf /var/lib/apt/lists/*

# ROS 2 のセットアップを自動で source
RUN echo "source /opt/ros/humble/setup.bash" >> /root/.bashrc

WORKDIR /ros2_ws
CMD ["bash"]
