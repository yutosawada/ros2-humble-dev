#!/bin/bash

# ROS2 Humble開発環境の不要なDockerリソースをクリーンアップするスクリプト

echo "🧹 不要なDockerリソースのクリーンアップを開始します..."
cd "$(dirname "$0")/.." || exit

# 現在の状態を表示
echo "📊 クリーンアップ前のディスク使用状況:"
docker system df

echo -e "\n🗑️ 使用していないコンテナを削除しています..."
docker container prune -f

echo -e "\n🗑️ 使用していないイメージを削除しています..."
docker image prune -a -f

echo -e "\n🗑️ 未使用のボリュームを削除しています..."
docker volume prune -f

echo -e "\n🗑️ ビルドキャッシュを削除しています..."
docker builder prune -a -f

# クリーンアップ後の状態を表示
echo -e "\n📊 クリーンアップ後のディスク使用状況:"
docker system df

echo -e "\n✅ Dockerリソースのクリーンアップが完了しました！"
