{ config, lib, pkgs, user, stateVersion, ... }:

let
  theme = import ../modules/theme;
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
      brave
      dconf
      discord
      docker
      firefox
      gimp
      htop
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
      x11.enable = true;
    };
  };

  services = {
    gnome-keyring = {
      enable = true;
      components = [
        "pkcs11"
        "secrets"
        "ssh"
      ];
    };

    xcape = {
      enable = true;
      mapExpression = {
        Super_L = "Super_L|a";
      };
    };
  };

  gtk = with theme; {
    enable = true;
    theme = {
      name = "Orchis";
      package = pkgs.orchis-theme;
    };
    iconTheme = {
      name = iconTheme.name;
      package = pkgs."${iconTheme.package}";
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
