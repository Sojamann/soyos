{ pkgs, ... }:
{
  home.file.".config/git/config".source = ./config;
  home.packages = with pkgs; [
    git
    diff-so-fancy
  ];
}
