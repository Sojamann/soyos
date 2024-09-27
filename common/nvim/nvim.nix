{ pkgs, ...}: {

  home.file = {
    ".config/nvim".source = ./config;
  };

  home.packages = with pkgs; [
    ripgrep
    fzf
    gcc
    shellcheck
  ];
}
