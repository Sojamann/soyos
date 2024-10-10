{ pkgs, ...}: {
  home.file = {
    ".config/alacitty/alacritty.toml".source = ./alacritty.toml;
    ".config/alacitty/catppuccin-mocha.toml".source = ./catppuccin-mocha.toml;
  };

   home.packages = with pkgs; [
    alacritty
  ];
}
