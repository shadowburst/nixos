{ pkgs, ... }:

let
  schemes = import ./schemes.nix;
  colors = schemes.doom
in {
  colors = {
    inherit colors;
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
  };

  iconTheme = {
    name = "Tela-Dark";
    package = pkgs.tela-circle-icon-theme;
  };
}
