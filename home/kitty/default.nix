{ pkgs, ...}: {
  home.file = {
    ".config/kitty/config.kitty".text = ''

        font_family     FiraCode Nerd Font Mono
        font_size       14.0

        cursor_shape beam

        scrollback_lines 5000

        enabled_layouts fat

        window_border_width     0pt
        window_margin_width     0
        window_padding_width    1

        # no bar
        hide_window_decorations yes

        background_tint         0.80
        background_tintgaps     0
        background_opacity      0.85
        background_blur         60
    '';
  };
}
