#!/bin/bash
set -e

YAML_FILE="$(dirname "$0")/clone_repos_config.yaml"
CLONE_DIR="$(dirname "$0")/ros2_ws/src"

if ! command -v yq &> /dev/null; then
  echo "yqが見つかりません。インストールを試みます..."
  if command -v snap &> /dev/null; then
    if command -v sudo &> /dev/null; then
      sudo snap install yq
    else
      snap install yq
    fi
  elif command -v apt-get &> /dev/null; then
    if command -v sudo &> /dev/null; then
      sudo apt-get update && sudo apt-get install -y yq
    else
      apt-get update && apt-get install -y yq
    fi
  else
    echo "snapやapt-getが利用できません。手動でyqをインストールしてください。" >&2
  fi
fi

if ! command -v yq &> /dev/null; then
  echo "yqのインストールに失敗しました。手動でインストールしてください。" >&2
  exit 1
fi

repos_count=$(yq e '.repositories | length' "$YAML_FILE")

for i in $(seq 0 $((repos_count-1))); do
  name=$(yq e ".repositories[$i].name" "$YAML_FILE")
  url=$(yq e ".repositories[$i].url" "$YAML_FILE")
  branch=$(yq e ".repositories[$i].branch" "$YAML_FILE")
  commit=$(yq e ".repositories[$i].commit" "$YAML_FILE")

  target_dir="$CLONE_DIR/$name"

  if [ -d "$target_dir/.git" ]; then
    echo "$name は既に存在します。スキップします。"
    continue
  fi

  if [ -n "$branch" ]; then
    git clone -b "$branch" "$url" "$target_dir"
  else
    git clone "$url" "$target_dir"
  fi

  if [ -n "$commit" ]; then
    cd "$target_dir"
    git checkout "$commit"
    cd - > /dev/null
  fi

done