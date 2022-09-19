let
  schemes = import ./schemes.nix;
  theme = schemes.doom
in {
  inherit theme;
  primary = theme.dark_blue;
  secondary = theme.dark_magenta;
  success = theme.dark_green;
  warning = theme.dark_yellow;
  danger = theme.dark_red;
}
