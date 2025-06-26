#!/usr/bin/env bash
set -e

# 1) ROS 2 Humble 環境を読み込む
source /opt/ros/humble/setup.bash

# 2) 自分のワークスペース（overlay）があれば読み込む
#    （任意：開発中の Launch ファイルやノードを含む場合）
if [ -f ~/ros2_ws/install/setup.bash ]; then
  source ~/ros2_ws/install/setup.bash
fi

# 3) 必要に応じて名前空間を指定
#    空文字にすれば名前空間なしで起動
NAMESPACE="navigation"
USE_NAMESPACE="false"

# 4) RViz 設定ファイルを指定
#    デフォルトは nav2_bringup のプリセット
RVIZ_CONFIG="$(ros2 pkg prefix nav2_bringup)/share/nav2_bringup/rviz/nav2_default_view.rviz"

# 5) 実際に ros2 launch を実行
ros2 launch nav2_bringup rviz_launch.py \
  namespace:="${NAMESPACE}" \
  use_namespace:="${USE_NAMESPACE}" \
  rviz_config:="${RVIZ_CONFIG}"
