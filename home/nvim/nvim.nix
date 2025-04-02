{ pkgs, ...}: {

  # nvim must be manually cloned from here:
  # https://github.com/Sojamann/nvim
  #
  # due the lock file being readonly when using nix.
  # The dependencies are still managed here!

  home.packages = with pkgs; [
    neovim
    ripgrep
    fzf
    gcc
    shellcheck
  ];
}
