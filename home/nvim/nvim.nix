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

    nodejs-slim_22
  ];
}
