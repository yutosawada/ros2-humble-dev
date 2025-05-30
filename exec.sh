#!/bin/bash

# ROS2 Humble開発環境のコンテナ内にシェルを起動するスクリプト

echo "🖥️ ROS2 Humble開発環境のコンテナに接続しています..."

# コンテナに接続
docker exec -it ros2-humble-dev /bin/bash

echo "👋 コンテナとの接続を終了しました。"
