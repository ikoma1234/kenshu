#!/bin/bash

# 安全なコマンド実行ラッパー
# 危険なコマンドをブロックする

# 禁止コマンドリスト
FORBIDDEN_COMMANDS=(
    "rm -rf"
    "rm -rf ~"
    "rm -rf /"
    "sudo rm -rf"
    "rm -fr"
    "chmod -R 777"
    "chown -R"
    "> /dev/sda"
    "dd if="
    "mkfs"
    "fdisk"
)

# 実行予定のコマンドをチェック
command_to_check="$*"

for forbidden in "${FORBIDDEN_COMMANDS[@]}"; do
    if [[ "$command_to_check" =~ $forbidden ]]; then
        echo "エラー: 危険なコマンド '$forbidden' の実行は禁止されています" >&2
        echo "実行しようとしたコマンド: $command_to_check" >&2
        exit 1
    fi
done

# 安全なコマンドの場合は実行
echo "コマンドを実行します: $command_to_check"
exec "$@"
