# 摸鱼游戏厅 · 10 款网页小游戏

10 款经典小游戏的纯前端实现，零依赖、零构建、零后端。双击任意 HTML 即可玩，也可一键部署到 GitHub Pages 获得在线地址。

## 游戏清单

| 文件 | 游戏 | 操作 |
|---|---|---|
| `index.html` | 游戏厅首页（10 款入口） | 点击卡片 |
| `2048.html` | 2048 | 方向键 / WASD / 手机滑动 |
| `tetris.html` | 俄罗斯方块 | ←→ 移动、↑ 旋转、↓ 加速、空格直落 |
| `minesweeper.html` | 扫雷（9×9 初级） | 左键翻开、右键插旗、长按插旗 |
| `guess-number.html` | 猜数字 1A2B | 输入 4 位不重复数字，回车提交 |
| `snake.html` | 贪吃蛇 | 方向键 / WASD / 滑动 |
| `breakout.html` | 打砖块 | ←→ 移动挡板、鼠标 / 触摸 |
| `flappy.html` | Flappy Bird | 空格 / 点击 / 触摸 |
| `dino.html` | 恐龙跑酷 | 空格 / 点击 / 触摸跳跃 |
| `memory.html` | 记忆翻牌（8 对） | 点击翻牌配对 |
| `cookie.html` | 饼干点击器 | 点击饼干、买升级 |

## 本地运行

直接双击 `index.html`，或：

```bash
python3 -m http.server 8000
# 浏览器打开 http://localhost:8000
```

## 部署到 GitHub Pages

1. 在 GitHub 新建一个仓库（例如 `moyu-games`），不要勾选初始化 README。
2. 把本目录所有文件上传到仓库根目录。
3. 进入仓库 **Settings → Pages**，Source 选 **Deploy from a branch**，Branch 选 `main` / `/ (root)`，保存。
4. 等待约 1 分钟，访问 `https://<你的用户名>.github.io/<仓库名>/` 即可。

也可在仓库目录执行（需已安装并登录 GitHub CLI）：

```bash
git init
git add .
git commit -m "feat: 10 款摸鱼小游戏"
gh repo create moyu-games --public --source=. --remote=origin --push
gh api repos/:owner/moyu-games/pages -X POST \
  -f source='{"branch":"main","path":"/"}'
```

## `shared.js` 说明

部署在带 `?sharecode=xxx` 的预览环境时，该脚本会自动把参数透传给站内链接，保证游戏间跳转不丢失访问凭证；本地打开时无参数，不产生任何影响。部署到 GitHub Pages 后不需要 sharecode，脚本自动跳过。

## 配图

`screenshots/` 下 10 张 PNG 是各游戏的实机截图，对应公众号文章里的配图，均为本项目自己生成，可自由使用。
