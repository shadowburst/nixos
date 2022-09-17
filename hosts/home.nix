{ config, lib, pkgs, user, stateVersion, ... }:

{
  programs.home-manager.enable = true;

  home = {
    inherit stateVersion;

    username = "${user}";
    homeDirectory = "/home/${user}";

    packages = with pkgs; [
      alacritty
      brave
      emacs
      feh
      light
      git
      mpv
      neovim
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
      name = "Tela-Dark";
      package = pkgs.tela-circle-icon-theme;
    };
    font = {
      name = "JetBrainsMono Nerd Font Regular";
    };
  };
}
