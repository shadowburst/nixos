{ config, lib, pkgs, stateVersion, user, ... }:

let
  theme = import ../theme;
in
{
  programs.home-manager.enable = true;

  imports = (import ../config);

  home = {
    inherit stateVersion;

    username = "${user}";
    homeDirectory = "/home/${user}";

    pointerCursor = {
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
      size = 16;
    };
  };

  services = {
    gnome-keyring.enable = true;
  };

  gtk = {
    enable = true;
    font.name = "${theme.fonts.normal} Regular";
    iconTheme = with theme; {
      name = icons.name;
      package = pkgs.${icons.packageName};
    };
    cursorTheme = {
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
      size = 16;
    };
    theme = {
      name = "Catppuccin-Macchiato-Standard-Blue-dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "blue" ];
        variant = "macchiato";
      };
    };
  };

  qt = {
    enable = true;
    platformTheme = "gtk";
    style = {
      name = "Catppuccin-Macchiato-Blue";
      package = pkgs.catppuccin-kvantum.override {
        accent = "Blue";
        variant = "Macchiato";
      };
    };
  };
}
