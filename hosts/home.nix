{ config, lib, pkgs, user, stateVersion, ... }:

let
  fonts = import ../modules/theme/fonts.nix;
  iconTheme = import ../modules/theme/iconTheme.nix;
in {
  programs.home-manager.enable = true;

  imports =
    (import ../modules/programs) ++
    (import ../modules/services);

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
    iconTheme = {
      name = iconTheme.name;
      package = iconTheme.package;
    };
    font = {
      name = "${fonts.normal} Regular";
    };
  };

  qt = {
    enable = true;
    platformTheme = "gtk";
    style.name = "adwaita-dark";
  };
}
