{ pkgs, ... }:

{
  imports = [
    ./ags
    # ./hyprland
    ./kanshi
    ./kitty
    ./mpv
  ];

  home.packages = with pkgs; [
    brave
    discord
    kdePackages.filelight
    pdfarranger
    seahorse
  ];
}
