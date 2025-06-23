#!/bin/bash

# ROS2ワークスペースのクリーンビルドスクリプト
echo "=== ROS2 Workspace Clean Build ==="

# 既存のビルドディレクトリを削除
echo "Removing build/, install/, log/ directories..."
rm -rf build/ install/ log/

# colconでビルド
echo "Building workspace with colcon..."
colcon build

# セットアップファイルをソース
echo "Sourcing setup.bash..."
source install/setup.bash

echo "=== Clean build completed ==="
