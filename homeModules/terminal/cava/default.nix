{ pkgs, ... }:

{
  home.packages = with pkgs; [
    cava
  ];
}
