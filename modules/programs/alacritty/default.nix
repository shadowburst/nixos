{ pkgs, ... }:

let
  theme = import ../../theme;
in {
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        env = {
          TERM = "xterm-256color";
          WINIT_X11_SCALE_FACTOR = "1.0";
        };
        shell = {
          program = "${pkgs.fish}/bin/fish";
          args = [
            "--login"
          ];
        };
        padding = {
          x = 8;
          y = 8;
        };
        opacity = 0.8;
      };
      font = with theme.fonts; {
        normal = {
          family = "${nerdMono}";
          style = "Regular";
        };
        bold = {
          family = "${nerdMono}";
          style = "Bold";
        };
        italic = {
          family = "${nerdMono}";
          style = "Italic";
        };
        bold_italic = {
          family = "${nerdMono}";
          style = "Bold Italic";
        };
      };
      colors = with theme.colors; {
        primary = {
          background = bg;
          foreground = fg;
        };
        normal = {
          black = black;
          red = dark_red;
          green = dark_green;
          yellow = dark_yellow;
          blue = dark_blue;
          magenta = dark_magenta;
          cyan = dark_cyan;
          white = dark_gray;
        };
        bright = {
          black = light_gray;
          red = light_red;
          green = light_green;
          yellow = light_yellow;
          blue = light_blue;
          magenta = light_magenta;
          cyan = light_cyan;
          white = white;
        };
      };
    };
  };
}
