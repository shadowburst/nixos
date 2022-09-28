{ pkgs, ... }:

let
  schemes = import ./schemes.nix;
  colors = schemes.doom;
in {
  inherit colors;
  primary = colors.dark_blue;
  secondary = colors.dark_magenta;
  success = colors.dark_green;
  warning = colors.dark_yellow;
  danger = colors.dark_red;
}
