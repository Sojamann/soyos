{ pkgs, ...}: 
let
  # until https://github.com/nix-community/home-manager/pull/5355 is merged
  nixalacritty = pkgs.writeShellScriptBin "nixalacritty" ''
    #!/bin/sh
    nix run --impure github:nix-community/nixGL -- alacritty "$@"
  '';
in
{
  home.file = {
    ".config/alacitty/alacritty.toml".source = ./alacritty.toml;
    ".config/alacitty/catppuccin-mocha.toml".source = ./catppuccin-mocha.toml;
  };

   home.packages = with pkgs; [
    nixalacritty
    alacritty
  ];
}
