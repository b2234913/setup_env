# install zsh
sudo apt install zsh -y

# install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended


# install powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k


# install plug-in
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting

sed -i "1 i\ZSH_DISABLE_COMPFIX=\"true\"" ~/.zshrc 
sed -i "s/ZSH_THEME=\"robbyrussell\"/ZSH_THEME=\"powerlevel10k\/powerlevel10k\"/g" $HOME/.zshrc
sed -i "s/plugins=(git)/plugins=(git extract z zsh-syntax-highlighting zsh-autosuggestions fast-syntax-highlighting)/g" $HOME/.zshrc

zsh
sed -i "1 i\ZSH_DISABLE_COMPFIX=\"true\"" ~/.zshrc
source ~/.zshrc
sudo chsh -s $(which zsh)
