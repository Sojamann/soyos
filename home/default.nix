{ config, pkgs, extra-packages, extra-env, username, ... }:
let
in
{
  targets.genericLinux.enable = true; # NON NIX OS

  home.username = username;
  home.homeDirectory = "/home/" + username;

  home.stateVersion = "24.05"; # Please read the comment before changing.

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.sessionVariables = {
    EDITOR = "nvim";
  } // extra-env;

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
    sd # find and replace

    # go
    go

    # python tooling but not python itself
    uv
    ruff

    # rust tooling
    rustup
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
  ];
}
