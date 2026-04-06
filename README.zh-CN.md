[English](README.md) | 简体中文

# Dotfiles

使用 [chezmoi](https://www.chezmoi.io/) 管理的跨平台 dotfiles 配置。

专为 Python/FastAPI 和 Node.js 开发优化，配备现代 CLI 工具、Neovim 工作流和 AI 辅助。

**支持平台**: macOS (Apple Silicon + Intel) 和 Linux (Ubuntu/Debian)

## 功能特性

- **现代 CLI 工具链**: ripgrep, zoxide, eza, bat, fd, fzf, delta, sd, carapace
- **Neovim**: LazyVim 配置，自定义快捷键和剪贴板同步
- **Python**: 基于 uv 的工作流和 FastAPI 别名（通过 pipx 安装）
- **Node.js**: nvm + pnpm 配置
- **AI 辅助**: Claude Code 编程助手，支持提供商切换
- **Shell**: Zsh + Oh My Zsh，精选插件和 vi 模式
- **自动化**: 通过 Homebrew 一键安装（macOS 和 Linux）
- **安全**: 使用 Age 加密敏感配置

## 快速开始

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply YOUR_GITHUB_USERNAME
```

**初始化时，chezmoi 会提示输入：**
- `Your name`: 你的名字（用于 git 提交）
- `Email address`: 你的邮箱（用于 git 提交）

这些值存储在 `.chezmoi.toml.tmpl` 中，会在整个 dotfiles 中使用（例如 git 配置）。

### ⚠️ 重要提示：Fork 用户必须重新配置加密

本仓库使用 [age](https://github.com/FiloSottile/age) 加密敏感文件（配置存储在 `.chezmoi.toml.tmpl` 中）。

**如果你 fork 此仓库，必须生成自己的 age 密钥对：**

```bash
# 1. 生成新的 age 密钥对
age-keygen -o key.txt

# 2. 显示你的公钥（复制输出内容）
cat key.txt

# 3. 将私钥移动到 chezmoi 配置目录
mv key.txt ~/.config/chezmoi/key.txt

# 4. 编辑 .chezmoi.toml.tmpl 并替换:
#    - recipient 公钥为你自己的公钥
#    - 可选：更新 name/email 提示信息

# 5. 从示例文件重新创建加密文件:
#    你无法解密原始的 .age 文件
#    参考 .example 文件创建自己的配置:

# 示例: 从 example 创建 .env
cp ~/.local/share/chezmoi/dot_env.example ~/.env
# 编辑文件填入你的值
chezmoi add --encrypt ~/.env

# 示例: 设置 Kaggle 凭证
mkdir -p ~/.kaggle
cp ~/.local/share/chezmoi/dot_kaggle/kaggle.json.example ~/.kaggle/kaggle.json
# 编辑填入你的 Kaggle API 凭证
chezmoi add --encrypt ~/.kaggle/kaggle.json

# 示例: 设置 Codex 认证（如果使用）
mkdir -p ~/.config/codex
cp ~/.local/share/chezmoi/dot_codex/auth.json.example ~/.config/codex/auth.json
# 编辑填入你的 Codex 凭证
chezmoi add --encrypt ~/.config/codex/auth.json
```

**可用的示例文件：**
- `dot_env.example` - 环境变量模板
- `dot_kaggle/kaggle.json.example` - Kaggle API 凭证
- `dot_codex/auth.json.example` - Codex 认证（可选）

**为什么？** 原始 age 密钥属于此仓库私有。加密文件（`.age` 后缀）只能由匹配的私钥解密。你必须使用示例模板创建自己的加密文件。

## 包含内容

### 核心工具

| 类别 | 工具 |
|----------|-------|
| **搜索** | ripgrep (rg), fd, fzf, ast-grep, sd (查找替换) |
| **导航** | zoxide (z), eza (ls), yazi (文件管理器) |
| **查看** | bat (cat), delta (git diff), difftastic |
| **Git** | lazygit, lazydocker, gh |
| **SSH** | lazyssh (服务器选择器), dmux (tmux 会话) |
| **终端** | ghostty, tmux, starship 提示符 |

### 开发工具

| 语言/工具 | 配置 |
|---------------|-------|
| **Python** | `uvs` (同步), `uvr` (运行), `uvdev` (FastAPI) - 通过 pipx |
| **Node.js** | nvm (版本管理), pnpm (包管理器) |
| **Neovim** | LazyVim + Catppuccin + AI/codeium, docker, json, markdown, python, toml, yaml 扩展 |
| **Claude Code** | AI 编程助手，支持提供商切换 (ccs) |
| **Docker** | lazydocker (TUI) |
| **命令运行器** | just (命令配方) |

### 数据和 JSON 工具

| 类别 | 工具 |
|----------|-------|
| **JSON** | jq, jaq (更快), fx (交互式), jless (分页), jnv (过滤) |
| **数据** | visidata (电子表格), qsv (CSV 工具集), kaggle CLI |
| **日志** | lnav (日志导航器), hl (日志高亮) |
| **HTTP/网络** | xh (httpie 替代), gping (图形化 ping), bore-cli (隧道) |

### 系统工具

| 类别 | 工具 |
|----------|-------|
| **监控** | btop (系统监控), procs (现代 ps) |
| **压缩** | zopfli, pigz (通过 targz 函数) |
| **安全** | age (加密) |
| **媒体** | ffmpeg, imagemagick, poppler, resvg |
| **归档** | sevenzip (7z) |

### 平台自动化

**macOS:**
- **系统**: 快速键重复 (1ms)，禁用自动纠正
- **Finder**: 标题栏显示完整路径，默认搜索当前文件夹
- **Dock**: 自动隐藏，零延迟，不显示最近应用
- **截图**: PNG 格式，无阴影
- **终端**: Ghostty GPU 加速

**Linux:**
- **包管理器**: Homebrew for Linux 或原生包管理器
- 所有 CLI 工具通过跨平台脚本自动安装
- 自动安装 nvm + Node.js 24 + pnpm

## 常用命令

```bash
chezmoi init GITHUB_USER     # 从 git 仓库初始化
chezmoi diff                 # 预览更改
chezmoi apply                # 应用更改
chezmoi edit FILE            # 编辑管理的文件（自动解密/加密）
chezmoi add FILE             # 添加文件到 chezmoi
chezmoi add --encrypt FILE   # 添加加密文件（使用 age）
chezmoi update               # 从 git 拉取最新
```

## 目录结构

```
~/.local/share/chezmoi/
├── .chezmoi.toml.tmpl          # chezmoi 配置
├── .chezmoiignore              # 排除文件
├── .chezmoitemplates/          # 可复用模板（zsh 模块）
│   ├── zsh/
│   │   ├── aliases.zsh         # 编辑器, Claude 别名
│   │   ├── env.zsh             # 环境变量
│   │   ├── functions.zsh       # Shell 函数（t, lg, y, ccs 等）
│   │   ├── keybindings.zsh     # vi-mode 快捷键
│   │   ├── modern-tools.zsh    # eza, bat, carapace
│   │   ├── node.zsh            # nvm 配置
│   │   ├── path.zsh            # PATH 配置
│   │   ├── python.zsh          # uv 别名
│   │   └── vi-mode.zsh         # vi-mode 设置
│   └── ...
├── dot_zshrc.tmpl              # Shell 配置
├── dot_zprofile.tmpl           # 登录 Shell 配置
├── dot_config/
│   ├── nvim/                   # Neovim (LazyVim)
│   ├── tmux/tmux.conf.tmpl     # tmux 配置（Ctrl+A 前缀）
│   ├── yazi/                   # Yazi 文件管理器
│   ├── git/config.tmpl         # 条件 git 邮箱
│   ├── git/ignore              # 全局 gitignore
│   ├── brew/Brewfile           # Homebrew CLI 包
│   ├── brew/Brewfile.casks     # GUI 应用（单独安装）
│   ├── starship.toml           # 提示符配置
│   ├── ghostty/config.tmpl     # 终端
│   ├── lazygit/config.yml      # Git TUI
│   ├── direnv/direnvrc         # 项目特定环境
│   ├── pipx/Pipxfile           # Python 全局包
│   └── debian/Aptfile          # Debian 包
├── run_once_*.sh.tmpl          # 一次性设置（平台特定）
├── run_onchange_after_*.tmpl   # 跨平台脚本（工具、包、插件）
└── run_onchange_after_darwin-*.tmpl  # macOS 特定脚本（GUI 应用、默认设置）
```

## Shell 函数

自定义函数快速参考：

| 函数 | 描述 |
|----------|-------------|
| `t [name]` | 创建/加入 tmux 会话（默认: "dev"） |
| `lg` | Lazygit（退出时 cd 到目录） |
| `y [path]` | Yazi 文件管理器（退出时 cd 到目录） |
| `s` | lazyssh（SSH 服务器选择器） |
| `d` | dmux（tmux 会话管理器） |
| `ccs <provider>` | 切换 Claude Code 提供商 |
| `mkd <dir>` | 创建目录并进入 |
| `o [file]` | 打开文件/目录（跨平台） |
| `server [port]` | 启动 HTTP 服务器（默认: 8000） |

## Claude Code 集成

### 插件市场
- `anthropics/claude-plugins-official` - 官方 Anthropic 插件
- `jarrodwatts/claude-hud` - 状态栏显示插件
- `openai/codex-plugin-cc` - GPT-5/Codex 集成
- `Yeachan-Heo/oh-my-claudecode` - 社区插件集合
- `affaan-m/everything-claude-code` - 综合插件生态

### 启用的插件
- **serena** - 语义编码工具，AST 操作
- **hookify** - 从对话分析中创建行为预防钩子
- **context7** - 库文档查询（替代 web 搜索）
- **claude-hud** - 实时状态栏集成
- **claude-md-management** - 文档管理（CLAUDE.md）
- **commit-commands** - Git 工作流自动化
- **security-guidance** - 安全漏洞检测

### 配置文件
- `~/.config/claude/settings.json` - 主设置和权限
- `~/.config/claude/marketplaces.txt` - 插件市场源
- `~/.config/claude/plugins/` - 已安装插件目录

## 自定义

**编辑管理的文件**：
```bash
chezmoi edit ~/.config/git/config
```

**进行更改**：编辑 `~/.local/share/chezmoi/` 中的文件，然后：
```bash
chezmoi diff   # 预览
chezmoi apply  # 应用
```

**提交更改**：
```bash
cd ~/.local/share/chezmoi
git add . && git commit -m "message"
```

## 文档

- [快速入门指南](QUICKSTART.md) / [Quick Start Guide](QUICKSTART.md)
- [chezmoi 文档](https://www.chezmoi.io/)
- [LazyVim](https://www.lazyvim.org/)
- [dotfiles 工具](https://dotfiles.github.io/utilities/)
- [uv 文档](https://docs.astral.sh/uv/)
