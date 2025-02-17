# Requirements
- rofi configured with HM (https://nix-community.github.io/home-manager/options.xhtml#opt-programs.rofi.enable)

# STUFF
1. Download Nix: https://nixos.org/download/
2. Create nix.conf
```bash
mkdir -p ~/.config/nix
echo 'extra-experimental-features = flakes nix-command' > ~/.config/nix/nix.conf
```
3. Build System
```bash
cd /path/to/flake/dir
nix-shell -p home-manager
home-manager switch --flake .#<home|work>
```

## Optional
- install kitty when wanting to use the kitty configuration
