{ config, pkgs, user-config, extra-packages, ... }:
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
  ] ++ extra-packages;

  
  imports = [
    ./tmux/tmux.nix
    ./bash/bash.nix
    ./nvim/nvim.nix
    ./starship/starship.nix
    ./git/git.nix
    ./yazi/default.nix
    ./rofi/default.nix
    ./stylix/default.nix
    ./alacritty/default.nix
    ./readline/default.nix
  ];
}
