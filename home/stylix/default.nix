{ pkgs, ... }: {

  stylix.enable = true;
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine.yaml";
  stylix.image = ./wallpaper.jpg;

  # see: https://stylix.danth.me/options/hm.html
  stylix.autoEnable = true;
  stylix.targets.kde.enable = false;
  stylix.targets.gnome.enable = false;

  stylix.fonts = {
    sizes.terminal = 14;

    monospace = {
      name = "FiraCode Nerd Font";
      package = pkgs.nerdfonts.override {fonts = ["FiraCode"];};
    };
  };

  stylix.opacity.terminal = 0.8;
}
