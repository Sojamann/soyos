# Requirements
- Fira Code Nerd Font

# STUFF
1. Download Nix: https://nixos.org/download/
2. Create nix.conf
```bash
mkdir -p ~/.config/nix
echo 'extra-experimental-features = flakes nix-command' > ~/.config/nix/nix.conf
```
3. Configure User Settings
```nix
{
    description = "My Config";
    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        soyos = {
            url = "github:Sojamann/soyos/main";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };
    outputs = { self, nixpkgs, soyos }: 
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
        homeConfigurations."robin" = soyos.home {
            user-config = {
                first-name = "Soy";
                last-name = "Boy";
                email="soy@boy.com";
                username="soyboy";
            };
            extra-packages = with pkgs; [
                # list of packages
            ];
        };
    };
}

```

5. Build System
```bash
cd /path/to/flake/dir
nix-shell -p home-manager
home-manager switch --flake .
```

## Optional
- install kitty when wanting to use the kitty configuration
