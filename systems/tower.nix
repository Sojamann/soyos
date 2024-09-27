{ config, pkgs, ... }:
{
  targets.genericLinux.enable = true; # NON NIX OS

  home.packages = with pkgs; [
    odin
  ];
}
