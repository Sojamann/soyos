{ pkgs, ... }: {
  home.file.".config/rofi/config.rasi".source = ./config.rasi;
  home.file.".config/rofi/theme.rasi".source = ./theme.rasi;
  home.packages = with pkgs; [
    rofi
#    kitty
  ];
}
