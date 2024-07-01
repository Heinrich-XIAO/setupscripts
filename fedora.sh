#/bin/sh

# Fedora Specific
sudo dnf install zsh cargo python3 python-is-python3 git gh pip alacritty flatpak gnome-tweaks vim neovim zoxide

if [ "$(uname -m)" = "aarch64" ]; then
    # If true, run the installation command with sudo
    sudo dnf install asahi-bless
fi

# General
pip install spotdl
cargo install bottom
flatpak install flathub com.ticktick.TickTick
flatpak install flathub dev.vencord.Vesktop
flatpak install flathub com.mattjakeman.ExtensionManager
flatpak install flathub org.strawberrymusicplayer.strawberry
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

cd ~
git clone https://github.com/Heinrich-XIAO/.dotfiles
rm -rf .config .zshrc .gitconfig .alacritty.toml
ln -s .dotfiles/config .config
ln -s .dotfiles/.zshrc
ln -s .dotfiles/.gitconfig
ln -s .dotfiles/.alacritty.toml

spotdl https://open.spotify.com/playlist/66eCVWXUFNYz5Iw3rp0aw3

