{ pkgs, ... }:

let
  theme = import ../../theme;
in
{
  programs.kitty = {
    enable = true;
    font.name = theme.fonts.nerdMono;
    shellIntegration.enableFishIntegration = true;
    settings = {
      cursor_text_color = "background";
      cursor_shape = "block";

      url_style = "curly";
      detect_urls = true;

      window_padding_width = "4";
      confirm_os_window_close = false;

      background_opacity = "0.8";
    };
    theme = "Tokyo Night Moon";
  };
}
