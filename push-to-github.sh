#!/bin/bash
# 一键推送到 GitHub Pages
# 用法：GITHUB_USER=你的用户名 ./push-to-github.sh [仓库名]
# 需要本机已安装并登录 gh CLI： https://cli.github.com/
set -e
USER_NAME="${GITHUB_USER:-}"
REPO="${1:-moyu-games}"
if [ -z "$USER_NAME" ]; then
  echo "请先设置用户名：GITHUB_USER=你的用户名 ./push-to-github.sh"
  exit 1
fi
if ! command -v gh >/dev/null 2>&1; then
  echo "未安装 GitHub CLI，请先安装：brew install gh && gh auth login"
  exit 1
fi
cd "$(dirname "$0")"
git init -b main 2>/dev/null || git init
git checkout -B main
git add -A
git commit -m "feat: 摸鱼游戏厅 10 款网页小游戏（编辑部风格 + 分类色）" || true
gh repo view "$USER_NAME/$REPO" >/dev/null 2>&1 || \
  gh repo create "$USER_NAME/$REPO" --public --source=. --remote=origin --push
git push -u origin main
# 开启 Pages（若已开启会返回错误，忽略）
gh api "repos/$USER_NAME/$REPO/pages" -X POST \
  -f source='{"branch":"main","path":"/"}' 2>/dev/null || true
echo "✅ 完成！约 1 分钟后访问：https://$USER_NAME.github.io/$REPO/"
