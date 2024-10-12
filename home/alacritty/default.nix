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
        decorations = "None";
        startup_mode = "Maximized";
      };
      env = {
        TERM = "xterm-256color";
      };
    };
  };

  home.packages = with pkgs; [
    nixalacritty
  ];
}
