{ pkgs, ...}: 
let
  # until https://github.com/nix-community/home-manager/pull/5355 is merged
  nixalacritty = pkgs.writeShellScriptBin "nixalacritty" ''
    #!/bin/sh
    nix run --impure github:nix-community/nixGL -- ${pkgs.alacritty}/bin/alacritty "$@"
  '';
in
{
  # home.file = {
  #   ".config/alacritty/alacritty.toml".source = ./alacritty.toml;
  #   ".config/alacritty/catppuccin-mocha.toml".source = ./catppuccin-mocha.toml;
  # };

  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        opacity = 0.8;
        decorations = "None";
        startup_mode = "Maximized";
      };
      env = {
        TERM = "xterm-256color";
      };
      font = {
        size = 14.0;
        normal.family = "FiraCode Nerd Font Mono";
      };
    };
  };

  home.packages = with pkgs; [
    nixalacritty
  ];
}
