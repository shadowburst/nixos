{ config, lib, pkgs, user, stateVersion, ... }:

let
  theme = import ../modules/theme
in {
  programs.home-manager.enable = true;

  imports = [(import ../modules)];

  xdg.userDirs.createDirectories = true;
  home = {
    inherit stateVersion;

    username = "${user}";
    homeDirectory = "/home/${user}";

    packages = with pkgs; [
      arandr
      bashtop
      brave
      discord
      docker
      firefox
      gimp
      kdenlive
      onlyoffice-bin
      pavucontrol
      playerctl
      wget
      wmctrl
    ];

    pointerCursor = {
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
      size = 16;
    };
  };

  gtk = {
    enable = true;
    theme = {
      name = "Orchis";
      package = pkgs.orchis-theme;
    };
    iconTheme = theme.iconTheme;
    font = {
      name = "${theme.fonts.normal} Regular";
    };
  };

  qt5 = {
    enable = true;
    platformTheme = "gtk";
    style = "adwaita-dark";
  };
}
