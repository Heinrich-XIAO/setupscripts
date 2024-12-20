#/bin/sh

# Fedora Specific
sudo dnf install -y zsh cargo python3 python-is-python3 git gh pip alacritty flatpak gnome-tweaks vim neovim zoxide cmake clang luarocks fastfetch hyprland strawberry waybar thunderbird fcitx5 lz4-devel NetworkManager-tui pavucontrol input-remapper steam

sudo dnf -y copr enable erikreider/SwayNotificationCenter
sudo dnf -y install SwayNotificationCenter

if [ "$(uname -m)" = "aarch64" ]; then
    # If true, run the installation command with sudo
    sudo dnf install asahi-bless
fi

# General
pip install spotdl
pip install pipx
cargo install bottom
cargo install wallust
flatpak install flathub com.ticktick.TickTick -y
flatpak install flathub dev.vencord.Vesktop -y
flatpak install flathub com.mattjakeman.ExtensionManager -y
flatpak install flathub org.strawberrymusicplayer.strawberry -y
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

cd ~
git clone https://github.com/Heinrich-XIAO/.dotfiles
rm -rf .config .zshrc .gitconfig .alacritty.toml
ln -s .dotfiles/config .config
ln -s .dotfiles/.zshrc
ln -s .dotfiles/.gitconfig
ln -s .dotfiles/.alacritty.toml

cd Music
spotdl https://open.spotify.com/playlist/66eCVWXUFNYz5Iw3rp0aw3
cd ~

cargo install --git https://github.com/nils-emmenegger/dmoj-submit
dmoj-submit set-config --language py:py3,cpp:cpp14 -vv


# Install zed
curl -f https://zed.dev/install.sh | sh



cd Downloads
git clone https://github.com/LGFae/swww.git
cd swww
cargo build --release

cd ~

sudo tee /etc/systemd/system/input-remapper.service > /dev/null << EOF
[Unit]
Description=Input Remapper 
After=graphical.target

[Service]
ExecStart=/usr/local/bin/input-remapper.sh
Type=oneshot
RemainAfterExit=true
StandardOutput=journal
StandardError=journal

[Install]
WantedBy=multi-user.target
EOF
sudo systemctl enable input-remapper
