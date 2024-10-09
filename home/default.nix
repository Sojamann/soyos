{ config, pkgs, user-config, extra-packages, nixgl, ... }:
let
in
{
  targets.genericLinux.enable = true; # NON NIX OS

  home.username = user-config.username;
  home.homeDirectory = "/home/" + user-config.username;

  home.stateVersion = "24.05"; # Please read the comment before changing.

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  xdg.desktopEntries = {
    testoo = {
      name = "Firefox";
      genericName = "Web Browser";
      exec = "firefox %U";
      terminal = false;
      categories = [ "Application" "Network" "WebBrowser" ];
      mimeType = [ "text/html" "text/xml" ];
    };
  };

  home.packages = with pkgs; [
    # basics
    git
    tmux
    neovim
    starship

    # utility programs
    bat
    yq-go
    gum

    # go
    go

    # python
    python312
    uv
    ruff

    pkgs.writeShellScriptBin "alacritty" ''
      #!/bin/sh
      ${nixgl.auto.nixGLNvidia}/bin/nixGLNvidia ${pkgs.kitty}/bin/kitty "$@"
    ''
  ] ++ extra-packages;

  
  imports = [
    ./tmux/tmux.nix
    ./bash/bash.nix
    ./nvim/nvim.nix
    ./starship/starship.nix
    ./git/git.nix
    ./yazi/default.nix
    ./rofi/default.nix
    ./kitty/default.nix
  ];
}
