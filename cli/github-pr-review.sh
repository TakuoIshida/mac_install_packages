REPO="edash-product/e-dash-app"
USER="TakuoIshida"
START="2024-04-01"
END="2025-03-31"

# 1. 対象期間の全PR番号を取得（状態問わず）
pr_numbers=$(gh pr list --repo "$REPO" \
  --search "created:$START..$END" \
  --state merged \
  --limit 1000 \
  --json number \
  --jq '.[].number')

echo "$pr_numbers 件のPRが対象"
# 2. TakuoIshida がレビューしたPR件数をカウント
count=0

for pr in $pr_numbers; do
  reviewers=$(gh pr view "$pr" --repo "$REPO" --json reviews --jq '.reviews[].author.login')
  if echo "$reviewers" | grep -q "$USER"; then
    echo "TakuoIshida reviewed $pr"
    count=$((count + 1))
  fi
done

echo "TakuoIshida reviewed $count PRs from $START to $END"
