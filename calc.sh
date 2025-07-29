#!/bin/bash

# 引数の個数チェック
if [ $# -ne 3 ]; then
    echo "使用方法: $0 [演算子] [数値1] [数値2]" >&2
    echo "例: $0 + 1 2" >&2
    exit 1
fi

# 引数を変数に代入
operator=$1
num1=$2
num2=$3

# 数値の妥当性チェック
if ! [[ "$num1" =~ ^-?[0-9]+(\.[0-9]+)?$ ]]; then
    echo "エラー: '$num1' は有効な数値ではありません" >&2
    exit 1
fi

if ! [[ "$num2" =~ ^-?[0-9]+(\.[0-9]+)?$ ]]; then
    echo "エラー: '$num2' は有効な数値ではありません" >&2
    exit 1
fi

# 演算処理
case $operator in
    "+")
        result=$(echo "$num1 + $num2" | bc)
        ;;
    "-")
        result=$(echo "$num1 - $num2" | bc)
        ;;
    "*")
        result=$(echo "$num1 * $num2" | bc)
        ;;
    "/")
        # ゼロ除算チェック
        if [ $(echo "$num2 == 0" | bc) -eq 1 ]; then
            echo "エラー: ゼロで除算することはできません" >&2
            exit 1
        fi
        result=$(echo "scale=10; $num1 / $num2" | bc)
        # 小数点以下の不要な0を削除
        result=$(echo "$result" | sed 's/\.0*$//' | sed 's/\.\([0-9]*[1-9]\)0*$/\.\1/')
        ;;
    *)
        echo "error"
        exit 1
        ;;
esac

# 結果を出力
echo "$result"
