{ inputs, lib, pkgs, ... }:

let
  app-menu = pkgs.writeShellScriptBin "app-menu" (lib.fileContents ./bin/app-menu);
  power-menu = pkgs.writeShellScriptBin "power-menu" (lib.fileContents ./bin/power-menu);
in
{
  imports = [ inputs.ags.homeManagerModules.default ];

  programs.ags = {
    enable = true;

    configDir = ./config;

    extraPackages = with pkgs; [
    ];
  };

  home.packages = [
    app-menu
    power-menu
  ];
}
