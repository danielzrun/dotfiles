[English](QUICKSTART.md) | 简体中文

# 快速入门

日常必备工具及其使用方法。

## 目录

- [导航与搜索](#导航与搜索)
- [文本处理](#文本处理)
- [Shell 函数](#shell-函数)
- [Git 与 GitHub](#git--与-github)
- [SSH 与会话](#ssh--与会话)
- [Python 开发](#python-开发)
- [进程管理](#进程管理)
- [Node.js 开发](#nodejs-开发)
- [数据与 JSON 工具](#数据--json-工具)
- [日志分析](#日志分析)
- [HTTP 与网络](#http--与网络)
- [编辑器与终端](#编辑器与终端)
- [Kaggle CLI](#kaggle-cli)

---

## 导航与搜索

### zoxide (智能 `cd`)

```bash
z <pattern>    # 模糊匹配跳转到目录
z <folder>     # 跳转到最近使用的文件夹
z               # 列出常用目录

# 示例
z dot          # 跳转到 dotfiles
z proj         # 跳转到项目文件夹
```

### eza (现代 `ls`)

```bash
eza             # 列出文件
eza -l          # 长格式
eza -la         # 所有文件，长格式
eza -T          # 树状视图
eza -la --git  # 显示 git 状态

# 别名
ls → eza --icons --git
ll → eza -l --header --time-style long-iso
la → eza -la --header --time-style long-iso
tree → eza --tree --icons
```

### ripgrep (快速 `grep`)

```bash
rg <pattern>              # 在当前目录搜索
rg <pattern> <path>       # 在路径中搜索
rg -i <pattern>           # 忽略大小写
rg -t py <pattern>        # 在 Python 文件中搜索
rg --glob '!*.pyc' <pat>  # 排除文件

# 示例
rg "TODO"                 # 查找 TODO
rg "def main"             # 查找 main 函数
rg -l "import"            # 只显示文件名
```

### fd (快速 `find`)

```bash
fd <pattern>              # 查找文件/目录
fd -t f <pattern>         # 只查找文件
fd -t d <pattern>         # 只查找目录
fd -e py <pattern>        # 按扩展名

# 示例
fd main                   # 查找 main 文件
fd -t d test              # 查找 test 目录
```

### fzf (模糊查找器)

```bash
# Ctrl+T - 插入文件路径
# Ctrl+R - 搜索命令历史
# Alt+C - 模糊切换目录

# 管道到 fzf
rg "pattern" | fzf
fd . | fzf
```

### sd (现代查找替换)

```bash
sd 'old' 'new' file.txt           # 简单替换
sd 'foo.*bar' 'baz' file.txt      # 正则替换
sd -s 'old' 'new' file.txt        # 字符串字面量替换
sd 'old' 'new' -i file.txt        # 忽略大小写
sd 'old' 'new' *.txt              # 多个文件

# 管道使用
cat file.txt | sd 'foo' 'bar'
rg "pattern" -l | sd "\.txt$" ".md"  # 通过列表重命名文件
```

比 sed 更快、更直观，正则表达式优先语法。

---

## Shell 函数

### 文件系统

```bash
mkd <dir>         # 创建目录并进入
o [file]          # 打开文件/目录（跨平台）
cdf               # cd 到 Finder 窗口位置（macOS）
```

### 开发工具

```bash
server [port]     # 启动 HTTP 服务器（默认: 8000）
dataurl <file>    # 从文件创建 data URL
digga <domain>    # DNS 查询（有用的输出）
getcertnames <domain>  # 显示 SSL 证书名称
```

### 压缩

```bash
targz <dir>       # 创建 .tar.gz 归档
gz <file>         # 比较原始文件与 gzipped 大小
```

### 终端应用

```bash
lg                # Lazygit（退出时 cd 到目录）
y [path]          # Yazi 文件管理器（退出时 cd 到目录）
s                 # lazyssh（SSH 服务器选择器）
d                 # dmux（tmux 会话管理器）
t [name]          # Tmux 会话（默认: "dev"）
ccs <provider>    # 切换 Claude Code 提供商
```

---

## Git 与 GitHub

### lazygit (Git TUI)

```bash
lg              # 打开 lazygit

# 快捷键
x       - 暂存/取消暂存文件
c       - 提交
p       - 推送
f       - 获取
?       - 帮助
```

### Git 别名

```bash
g               # git
gst             # git status
gd              # git diff
gco <branch>    # git checkout
gcmsg           # git commit -m
gp              # git push
gl              # git pull
gb              # git branch
glog            # git log --oneline --graph --decorate
```

### gh (GitHub CLI)

```bash
gh pr list              # 列出 PR
gh pr checkout 123      # 检出 PR
gh issue create         # 创建 issue
gh repo view            # 显示仓库信息
```

---

## SSH 与会话

### lazyssh (SSH 服务器选择器)

```bash
s                       # 快速打开 SSH 选择器（别名）
lazyssh                 # 完整命令
```

用于快速连接已保存 SSH 服务器的交互式 TUI。按 `?` 查看帮助，`q` 退出。

### dmux (Tmux 会话管理器)

```bash
d                       # 快速打开 dmux（别名）
dmux                    # 完整命令
```

用于组织终端工作区的 tmux 会话管理器。自动创建 `.dmux/` 目录用于会话状态。

---

## Python 开发

### uv (Python 包管理器)

**安装**: `pipx install uv`

```bash
# 项目设置
uvinit                  # 初始化项目（别名）
uv venv                 # 创建 venv
uvs                     # uv sync（安装依赖）

# 日常工作流
uvr <cmd>               # uv run
uva <pkg>               # uv add
uvd <pkg>               # uv remove
uvlock                  # uv lock
uvpython                # uv python

# FastAPI 开发
uvdev                   # uvicorn main:app --reload
uvdevh                  # uvicorn --reload --host 0.0.0.0

# 测试
uvtest                  # pytest
uvtestv                 # pytest -v
uvshell                 # ipython

# 传统 venv（备用）
venv                    # python3 -m venv .venv
act                     # source .venv/bin/activate
deact                   # deactivate
```

### direnv (每目录环境)

```bash
# 在项目根目录创建 .envrc
echo 'layout_uv' > .envrc

# 使用
direnv allow            # 允许 .envrc（首次或更改后）
direnv reload           # 手动重新加载 .envrc
direnv edit             # 在 $EDITOR 中编辑 .envrc

# 常用布局
layout_uv               # 自动激活 uv venv（Python）
layout_node             # 自动检测 Node 版本
use python              # 使用系统 Python
use node                # 使用系统 Node

# 故障排除
direnv status           # 显示状态和已加载的环境
direnv allow .          # 允许当前目录
```

**示例 .envrc 文件**：

```bash
# 使用 uv 的 Python 项目
layout_uv

# 或指定 Python 版本
layout_python python3.12

# Node.js / React 项目
layout_node

# 自定义环境变量
export DATABASE_URL="postgresql://localhost/mydb"
export DEBUG=true
```

---

## 进程管理

### procs (现代 ps)

```bash
procs                   # 彩色进程列表
procs python            # 按名称过滤
procs --tree            # 树状视图
procs --sort cpu        # 按 CPU 排序
procs --watch           # 自动刷新（类似 htop）
```

ps 的现代替代品，具有彩色输出、自动格式化和智能列大小调整。

---

## Node.js 开发

### nvm (Node 版本管理器)

```bash
# 安装 Node.js
nvm install 24          # 安装 Node.js 24
nvm alias default 24    # 设为默认

# 日常使用
nvm use 24              # 切换到 Node.js 24
node --version          # 检查版本
```

### pnpm (包管理器)

```bash
pnpm install            # 安装依赖
pnpm add <pkg>          # 添加包
pnpm dev                # 运行 dev 脚本
pnpm build              # 构建项目
```

---

## 数据与 JSON 工具

### jq / jaq (JSON 处理器)

```bash
jq '.'                  # 美化 JSON
jq '.key'               # 提取键
jq 'map(.key)'          # 转换数组
jq -c                   # 紧凑输出（节省 token）

# jaq 更快（Rust 实现）
jaq '.' file.json
```

### fx (交互式 JSON 查看器)

```bash
fx file.json            # 交互式 JSON 查看器
# 按: / 搜索, q 退出
```

### jless (JSON 分页器)

```bash
jless file.json         # 使用 vim 快捷键查看 JSON
# hjkl - 导航, q - 退出
```

### jnv (交互式 JSON 过滤器)

```bash
jnv file.json           # 交互式 JSON 过滤
# 实时输入过滤器，立即看到结果
```

### visidata (终端电子表格)

```bash
vd file.csv             # 将 CSV/TSV 作为电子表格打开
# 快捷键: < 排序, / 搜索, q 退出
```

### qsv (快速 CSV 工具集)

```bash
qsv count data.csv      # 统计行数
qsv select col1,col2    # 选择列
qsv search pattern      # 搜索 CSV
qsv stats               # 列统计
```

---

## 日志分析

### lnav (日志文件导航器)

```bash
lnav /var/log/*.log     # 查看带语法高亮的日志
# 快捷键: / 搜索, :help 查看命令
```

### hl (日志高亮器)

```bash
hl -c error log.txt     # 用颜色高亮错误
hl -p "ERROR|WARN" log  # 自定义模式
```

---

## HTTP 与网络

### xh (HTTP 客户端)

```bash
xh https://api.example.com    # GET 请求
xh POST https://api.example.com name=John  # POST
xh -f https://api.example.com  # 跟随重定向
```

### gping (带图形的 Ping)

```bash
gping google.com       # 带实时图形的 ping
gping 8.8.8.8 1.1.1.1  # 多个主机
```

### bore-cli (隧道)

```bash
bore local 8000        # 将 localhost:8000 隧道到公网 URL
```

---

## 编辑器与终端

### yazi (文件管理器)

```bash
y [path]               # 打开 yazi（退出时 cd 到目录）
# 快捷键:
# q - 退出并 cd 到选中目录
# hjkl - 导航
# / - 搜索
# Enter - 打开
```

### Neovim (LazyVim)

**启用扩展**: codeium (AI), mini-surround, docker, json, markdown, python, toml, yaml

```vim
# 系统剪贴板
Cmd+C / Cmd+V           # 复制/粘贴（普通/插入模式）

# 快速操作
<space> + e             # 文件浏览器
<space> + f             # 查找文件
<space> + b             # 缓冲区
<space> + gd            # 跳转到定义
:spell                  # 切换拼写检查
```

### ghostty (终端模拟器)

```bash
# 新标签: Cmd+T
# 分屏: Cmd+D (水平), Cmd+Shift+D (垂直)
# 导航分屏: Cmd+[ | Cmd+]
# 关闭标签: Cmd+W
```

### tmux (终端复用器)

```bash
tmux                    # 启动会话

# 前缀键: Ctrl+A（从默认 Ctrl+B 自定义）
# 快捷键（先按 Ctrl+A 然后:）
Ctrl+A c                # 新窗口（在当前目录）
Ctrl+A n / Ctrl+A p     # 下一个/上一个窗口
Ctrl+A 0-9              # 按数字切换窗口
Ctrl+A ,                # 重命名/锁定窗口
Ctrl+A w                # 列出窗口
Ctrl+A |                # 垂直分屏
Ctrl+A -                # 水平分屏
Ctrl+A arrow keys       # 导航面板
Ctrl+A x                # 关闭面板
Ctrl+A d                # 分离会话
Ctrl+A r                # 重新加载配置

# 会话管理
t [name]                # 快速加入/创建（函数）
tmux ls                 # 列出会话
tmux attach             # 重新加入会话
```

### 系统监控

```bash
btop                    # 现代系统监控（htop 替代）
# 快捷键: q 退出, / 过滤, F4 进程过滤
```

### 命令运行

```bash
just                    # 列出可用命令
just run                # 运行命令
just -l                 # 列出所有配方
```

---

## Kaggle CLI

```bash
kaggle competitions list           # 列出竞赛
kaggle competitions download -c <name>  # 下载竞赛数据
kaggle datasets download -d <name> # 下载数据集
kaggle kernels output <username>   # 查看内核输出
kaggle kernels list                # 列出内核
kaggle files list <competition>    # 列出竞赛文件
```

用于数据科学竞赛和数据集的 Kaggle CLI（通过 pipx 安装）。
