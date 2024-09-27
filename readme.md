# TODO
[ ] system packages ?
[ ] fonts?     # fira-code
    # fira-code-symbols
    # nerdfonts

# STUFF
1. Download Nix: https://nixos.org/download/
2. Create nix.conf
```bash
mkdir -p ~/.config/nix
echo 'extra-experimental-features = flakes nix-command' > ~/.config/nix/nix.conf
```
3. clone repo to some destination
```bash
git clone https://this/repo /path/to/cloned/repo
```
4. Create User Config
```bash
# create config which is used to setup the system
cat <<EOF >./user-config.nix
{
    username = "...";
    first-name = "...";
    last-name = "...";
    email = "...";
}
EOF

# when using flakes within a git repo nix will only regard
# files added to the index ... which we don't want for this file
# this will make it work
# see: https://nixos.wiki/wiki/Flakes#How_to_add_a_file_locally_in_git_but_not_include_it_in_commits
git add --intent-to-add ./user-config.nix
git update-index --skip-worktree --assume-unchanged ./user-config.nix
```

5. Build System
```
nix-shell -p home-manager

# Activate the setup ... which might fail when
# files like the .bashrc already exist
#
# <setup> = tower/work
home-manager switch --flake /path/to/cloned/repo#<setup>
```
