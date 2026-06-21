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
brew install --cask ghostty aldente docker modem-dev/tap/hunk
# install other shizzle
brew install \
	mise \
	tmux starship yazi fd sd bat yq fzf ripgrep \
	shellcheck tree-sittercli node \
	kubectl k9s helm
# install nightly of neovim
brew install neovim --HEAD

# install development toolchains (no specific language versions)
brew install uv

mise install
```

```bash
# start tmux and press CTRL+SPACE+I
```

