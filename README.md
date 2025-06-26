# ROS2 Humble Development Environment

このプロジェクトは、Dockerを使用してROS2 Humbleの開発環境を構築するためのものです。以下のファイルが含まれています。

## 構成ファイル

- **Dockerfile**: Dockerイメージを構築するための指示が含まれています。ROS2 Humbleのベースイメージを使用し、必要なパッケージや依存関係をインストールします。

- **docker-compose.yaml**: Docker Composeの設定ファイルで、サービスの定義やネットワーク設定、ボリュームのマウントなどを行います。

- **scripts/entrypoint.sh**: コンテナ起動時に実行されるスクリプトで、ROS2の環境をセットアップし、必要なコマンドを実行します。

- **src/README.md**: プロジェクトのソースコードに関するドキュメントが含まれています。

## 使用方法

1. このリポジトリをクローンします。
2. DockerとDocker Composeがインストールされていることを確認します。
3. 以下のコマンドを実行してDockerイメージをビルドします。

   ```
   docker-compose build
   ```

4. コンテナを起動します。

   ```
   docker-compose up
   ```

5. コンテナ内でROS2の開発を開始します。

## 注意事項

- このプロジェクトはROS2 Humbleに特化しています。他のバージョンのROS2を使用する場合は、Dockerfileや設定ファイルを適宜変更してください。

- 開発環境のカスタマイズが必要な場合は、Dockerfileやentrypoint.shを編集してください。

- 新しい環境でrvizを使用する場合、ホストで以下のコマンドを実行する必要があります。

  ```bash
  xhost +local:root
  ```
