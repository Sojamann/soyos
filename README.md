# SOYOS

## Get
```bash
git clone --bare git@github.com:Sojamann/soyos.git ~/.soyos/
config --local status.showUntrackedFiles no
config checkout

# install mise
curl https://mise.run | sh
source ~/.bashrc # source again now that mise is available
mise install

# install other deps
dnf install nvim diff-so-fancy build-essentials gcc

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
