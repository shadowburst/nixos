{ pkgs, ... }:

let
  font = "JetBrainsMono Nerd Font Mono";
  theme = import ../../theme;
  colors = theme.colors;
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
        opacity = "0.8";
      };
      font = {
        normal = {
          family = "${font}";
          style = "Regular";
        };
        bold = {
          family = "${font}";
          style = "Bold";
        };
        italic = {
          family = "${font}";
          style = "Italic";
        };
        bold_italic = {
          family = "${font}";
          style = "Bold Italic";
        };
      };
      colors = {
        primary = {
          background = colors.bg;
          foreground = colors.fg;
        };
        normal = {
          black = colors.black;
          red = colors.dark_red;
          green = colors.dark_green;
          yellow = colors.dark_yellow;
          blue = colors.dark_blue;
          magenta = colors.dark_magenta;
          cyan = colors.dark_cyan;
          white = colors.dark_gray;
        };
        bright = {
          black = colors.light_gray;
          red = colors.light_red;
          green = colors.light_green;
          yellow = colors.light_yellow;
          blue = colors.light_blue;
          magenta = colors.light_magenta;
          cyan = colors.light_cyan;
          white = colors.white;
        };
      };
    };
  };
}
