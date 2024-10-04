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
    yq
    gum
    lf

    # programming languages
    go

    python312
    python312Packages.pip
  ] ++ extra-packages;

  
  imports = [
    ./tmux/tmux.nix
    ./bash/bash.nix
    ./nvim/nvim.nix
    ./starship/starship.nix
    ./git/git.nix
    ./lf/default.nix
    ./yazi/default.nix
  ];
}
