let
  schemes = import ./schemes.nix;
  colors = schemes.doom;
in {
  colors = {
    inherit (colors) bg fg black dark_gray dark_red light_red dark_green light_green dark_yellow light_yellow dark_blue light_blue dark_magenta light_magenta dark_cyan light_cyan light_gray white;
    primary = colors.dark_blue;
    secondary = colors.dark_magenta;
    success = colors.dark_green;
    warning = colors.dark_yellow;
    danger = colors.dark_red;
  };

  fonts = {
    normal = "Noto Sans";
    mono = "Noto Sans Mono";
    nerd = "JetBrainsMono Nerd Font";
    nerdMono = "JetBrainsMono Nerd Font Mono";
  };

  iconTheme = {
    name = "Tela-Dark";
    package = "tela-circle-icon-theme";
  };
}
