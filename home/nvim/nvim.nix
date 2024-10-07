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

    python312Packages.pylint
    nodejs-slim_22
  ];
}
