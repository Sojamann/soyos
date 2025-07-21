# SOYOS

## Get
```bash
git clone --bare git@github.com:Sojamann/soyos.git ~/.soyos/
alias config='git --git-dir=$HOME/.soyos --work-tree=$HOME'
config config --local status.showUntrackedFiles no
config checkout # remove conflicting files if there are errors
```

Install dependencies:
```bash
# Install Terminal (+deps to build tmux)
dnf install alacritty gcc ncurses-devel bison

# hyperland dependencies
dnf install \
    hyprland \
    hyprpaper \
    hyprlock \
    waybar \
    wofi

# install dev dependencies
curl https://mise.run | sh
source ~/.bashrc # source again now that mise is available
mise install
```

Get the fonts:
```bash
curl -L https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.tar.xz \
    | tar -Jxf- -C ~/.local/share/fonts --strip-components 1
fc-cache -vf
fc-list # to verify

# start tmux and press CTRL+SPACE+I
```

