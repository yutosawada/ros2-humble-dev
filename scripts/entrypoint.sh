#!/bin/bash

# ROS2 Humbleの環境をセットアップ
source /opt/ros/humble/setup.bash

# ワークスペースのセットアップ
if [ -f "/ros2_ws/install/setup.bash" ]; then
    source /ros2_ws/install/setup.bash
fi

# 引数がある場合はコマンドを実行
if [ "$#" -gt 0 ]; then
    exec "$@"
else
    # デフォルトのシェルを起動
    exec /bin/bash
fi