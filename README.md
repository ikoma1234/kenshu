# 研修プロジェクト (kenshu)

研修で作成する様々なスクリプトファイル（主にBashスクリプト）やその他のファイルを格納するリポジトリです。

## 📁 プロジェクト構成

```
kenshu/
├── README.md                    # このファイル
├── calc.sh                      # 計算機スクリプト
├── mcp.json                     # MCP (Model Context Protocol) 設定
├── .github/
│   └── copilot-instructions.md  # Copilot指示書
└── .vscode/
    └── settings.json            # VS Code設定
```

## 🚀 使用方法

### 計算機スクリプト (calc.sh)

四則演算を行うBashスクリプトです。

```bash
# 実行権限を付与（初回のみ）
chmod +x calc.sh

# 使用例
./calc.sh + 5 3    # 加算: 結果は 8
./calc.sh - 10 4   # 減算: 結果は 6
./calc.sh \* 3 7   # 乗算: 結果は 21
./calc.sh / 15 3   # 除算: 結果は 5
```

**対応演算子:**
- `+` : 加算
- `-` : 減算
- `*` : 乗算（シェルでは `\*` とエスケープが必要）
- `/` : 除算

## 🛠️ 開発環境セットアップ

### 必要なツール
- **Bash**: macOS/Linux標準
- **Git**: バージョン管理
- **VS Code**: エディタ（推奨）

### 初期設定

```bash
# リポジトリをクローン
git clone https://github.com/ikoma1234/kenshu.git
cd kenshu

# スクリプトに実行権限を付与
chmod +x *.sh
```

### VS Code設定

プロジェクトには以下のVS Code設定が含まれています：

- **危険なコマンドの実行防止**: `rm -rf`等の危険なコマンドをブロック
- **Copilot設定**: 自動承認機能を有効化

## 📋 開発ワークフロー

### 新しいスクリプトの作成

```bash
# 新しいスクリプトファイルを作成
touch new_script.sh

# 実行権限を付与
chmod +x new_script.sh

# 基本的なテスト実行
./new_script.sh
```

### Gitワークフロー

```bash
# 新しいファイルを追加
git add filename

# コミット（日本語メッセージ推奨）
git commit -m "説明: 機能の概要"

# 変更の確認
git status
git log --oneline

# リモートにプッシュ
git push
```

## 📝 コーディング規約

### 基本原則

1. **日本語メッセージ**: エラーメッセージと使用方法は日本語で記述
2. **エラーハンドリング**: 適切な入力検証とエラー処理を実装
3. **標準エラー出力**: エラーメッセージは `stderr` (`>&2`) に出力

### スクリプトテンプレート

```bash
#!/bin/bash

# 引数の個数チェック
if [ $# -ne 期待する引数数 ]; then
    echo "使用方法: $0 [引数の説明]" >&2
    echo "例: $0 example_argument" >&2
    exit 1
fi

# 引数を変数に代入
arg1=$1

# 入力検証
if [ 条件 ]; then
    echo "エラー: [メッセージ]" >&2
    exit 1
fi

# メイン処理
# ...
```

## 🔒 セキュリティルール

### 禁止コマンド

以下のコマンドは**絶対に使用禁止**です：

- `rm -rf` (任意のパス)
- `rm -rf ~` (ホームディレクトリ削除)
- `rm -rf /` (ルートディレクトリ削除)
- `sudo rm -rf` (管理者権限での強制削除)
- `chmod -R 777` (全権限付与)
- `> /dev/sda` (ディスク直接書き込み)

### 安全な実行

VS Code設定により、危険なコマンドは自動的にブロックされます。

## 📚 MCP設定

`mcp.json`ファイルにはModel Context Protocol (MCP)の設定が含まれています：

- **GitHub MCP**: GitHubとの連携機能

## 🤝 貢献方法

1. **Issue作成**: バグ報告や機能提案
2. **ブランチ作成**: `feature/機能名` または `fix/修正内容`
3. **プルリクエスト**: 変更内容の詳細な説明を含める
4. **レビュー**: コードレビューを経てマージ

## 📄 ライセンス

このプロジェクトは研修目的で作成されています。

## 📞 サポート

質問や問題がある場合は、GitHubのIssueを作成してください。

---

**Happy Coding! 🎉**
