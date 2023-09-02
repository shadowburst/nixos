{ pkgs, ... }:

{
  programs.lf = {
    enable = true;
  };

  xdg.configFile."lf" = {
    source = ./config;
    recursive = true;
  };

  home.packages = with pkgs; [
    ctpv
  ];
}
