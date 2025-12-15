#!/bin/bash

set -e

echo "===== 開始安裝 PyEnv 和依賴軟體 ====="

# 步驟 1: 安裝相依軟體
echo "1. 安裝編譯依賴軟體..."
sudo apt-get update
sudo apt-get install -y build-essential libssl-dev libffi-dev python3-dev zlib1g-dev liblzma-dev libsqlite3-dev libreadline-dev

# 步驟 2: 安裝 PyEnv
echo "2. 安裝 PyEnv..."
curl -fsSL https://pyenv.run | bash

# 步驟 3: 修改 ~/.zshrc
echo "3. 配置 ~/.zshrc..."
ZSHRC="$HOME/.zshrc"

# 檢查是否已存在 pyenv 配置
if grep -q "pyenv init" "$ZSHRC"; then
    echo "   已存在 pyenv 配置，更新中..."
    # 移除舊的 pyenv 配置
    sed -i '/export PYENV_ROOT/d' "$ZSHRC"
    sed -i '/\[\[ -d \$PYENV_ROOT/d' "$ZSHRC"
    sed -i '/pyenv init/d' "$ZSHRC"
fi

# 添加新的 pyenv 配置
cat >> "$ZSHRC" << 'EOF'

# PyEnv Configuration
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"
EOF

echo "4. 重新加載 zsh 配置..."
source "$ZSHRC"

echo ""
echo "===== 安裝完成 ====="
echo "請執行以下命令來驗證："
echo "  pyenv --version"
echo ""
echo "然後可以安裝 Python，例如："
echo "  pyenv install 3.11.14"
echo "  pyenv global 3.11.14"
