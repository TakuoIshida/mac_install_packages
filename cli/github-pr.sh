#!/bin/bash

# 設定
REPO="edash-product/e-dash-app"  # リポジトリ名
USERS=("TakuoIshida" "yuuki1036" "lusingander" "jellyfish1129" "issnoj")      # 対象ユーザー
SINCE="2024-04-01"
UNTIL="2025-03-31"

for user in "${USERS[@]}"; do
  echo "=== $user の PR数（$SINCE ~ $UNTIL) ==="

  count=$(gh pr list \
    --repo "$REPO" \
    --search "created:$SINCE..$UNTIL author:$user" \
    --state merged \
    --limit 1000 \
    --json number \
    --jq 'length')

  echo "$count 件"
  echo
done

# github auth login

