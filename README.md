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
# install essentialls
brew install git 7zip

# install grapical tools
brew install --cask ghostty aldente raycast
# install other shizzle
brew install \
	mise \
	tmux starship yazi fd sd bat yq fzf ripgrep \
	shellcheck node \
	kubectl k9s helm
# install nightly of neovim
brew install neovim --HEAD

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

