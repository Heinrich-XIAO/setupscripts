#/bin/sh

# Fedora Specific
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf install -y zsh cargo python3 python-is-python3 git gh pip alacritty flatpak gnome-tweaks vim neovim zoxide cmake clang luarocks fastfetch hyprland strawberry waybar thunderbird fcitx5 lz4-devel NetworkManager-tui pavucontrol input-remapper steam cmus jetbrains-mono-fonts
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

sudo dnf -y copr enable erikreider/SwayNotificationCenter
sudo dnf -y install SwayNotificationCenter


sudo dnf copr enable sneexy/zen-browser -y
sudo dnf -y install zen-browser

sudo dnf -y install dnf-plugins-core
sudo dnf-3 config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo systemctl enable --now docker

if [ "$(uname -m)" = "aarch64" ]; then
    # If true, run the installation command with sudo
    sudo dnf install asahi-bless
fi

# General
pip install spotdl
pip install pipx
cargo install bottom
cargo install wallust
flatpak install flathub dev.vencord.Vesktop -y
flatpak install flathub com.mattjakeman.ExtensionManager -y
flatpak install flathub org.kde.kwalletmanager5 -y
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


cd ..

wget -c "https://github.com/Milkshiift/GoofCord/releases/download/v1.8.1/GoofCord-1.8.1-linux-x86_64.rpm"
sudo rpm -i "GoofCord-1.8.1-linux-x86_64.rpm"


cd ~

sudo tee /usr/local/bin/input-remapper.sh > /dev/null << EOF
#!/bin/bash
sudo pkill -f input-remapper-service
sudo input-remapper-service -d &
sleep 2
input-remapper-control --command autoload
EOF
sudo chmod +x /usr/local/bin/input-remapper.sh



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

sudo npm install --global web-ext
