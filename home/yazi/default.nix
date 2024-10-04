{ pkgs, ... }: {
  programs.yazi.enable = true;
  programs.yazi.settings = {
    show_hidden = true;
    show_symlinks = true;
  };
}
