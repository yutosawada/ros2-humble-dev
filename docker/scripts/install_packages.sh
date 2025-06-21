#!/bin/bash
# Install apt packages defined in a YAML file
# Usage: install_packages.sh <yaml_file> <section>
set -e

YAML_FILE="$1"
SECTION="$2"

if [ -z "$YAML_FILE" ] || [ -z "$SECTION" ]; then
  echo "Usage: $0 <yaml_file> <section>" >&2
  exit 1
fi

if ! command -v yq >/dev/null 2>&1; then
  echo "yq command not found" >&2
  exit 1
fi

COUNT=$(yq e ".${SECTION} | length" "$YAML_FILE")
PACKAGES=()
for i in $(seq 0 $((COUNT-1))); do
  NAME=$(yq e ".${SECTION}[${i}].name" "$YAML_FILE")
  VER=$(yq e ".${SECTION}[${i}].version" "$YAML_FILE")
  if [ "$VER" != "null" ] && [ -n "$VER" ]; then
    PACKAGES+=("${NAME}=${VER}")
  else
    PACKAGES+=("${NAME}")
  fi
done

apt-get update
apt-get install -y "${PACKAGES[@]}"
apt-get clean
rm -rf /var/lib/apt/lists/*