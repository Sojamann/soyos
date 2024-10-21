{ pkgs, ... }: {

  stylix.enable = true;
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine.yaml";
  stylix.image = ./wallpaper.jpg;

  # see: https://stylix.danth.me/options/hm.html
  stylix.autoEnable = false;
  stylix.targets.fzf.enable = true;
  stylix.targets.bat.enable = true;
  stylix.targets.alacritty.enable = true;
  stylix.targets.tmux.enable = true;
  stylix.targets.yazi.enable = true;

  stylix.fonts = {
    sizes.terminal = 14;

    monospace = {
      name = "FiraCode Nerd Font";
      package = pkgs.nerdfonts.override {fonts = ["FiraCode"];};
    };
  };

  stylix.opacity.terminal = 0.8;
}
