{ pkgs, ...}: {

  home.file = {
    ".config/nvim".source = ./config;
  };

  home.packages = with pkgs; [
    neovim
    ripgrep
    fzf
    gcc
    shellcheck
    cargo # also to build plugins
    rustc

    nodejs-slim_22
  ];
}
