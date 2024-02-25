# RealWorld
ブログプラットフォームを作る RealWorld という OSS のプロジェクトがあります。RealWorld は実世界と同じ機能を持つプラットフォームを作ることで、学習したいフレームワークの技術を習得することを目的としてたプロジェクトです。

ここでは、RealWorld の バックエンドの API の仕様を満たす Rails API を作成します。

# デプロイ先
AWS/EC2

# アーキテクチャイメージ
![アーキテクチャ](AWS_conduit_infra.svg)

# 使用技術
- Ruby 3.2.2
  - Rails 7.1.2 APImode
  - sqlite 1.6.9

# 実装したもの
- 記事のCRUDのエンドポイント
- 認証
- 認可
- 少しのエンドポイントテストコード
