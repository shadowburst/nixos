{ pkgs, ... }:

let
  app-menu = pkgs.writeShellScriptBin "app-menu" ''
    fuzzel
  '';
in
{
  programs.fuzzel = {
    enable = true;
  };

  xdg.configFile."fuzzel" = {
    source = ./config;
    recursive = true;
  };

  home.packages = [
    app-menu
  ];
}
