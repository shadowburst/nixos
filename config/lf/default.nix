{ pkgs, ... }:

{
  programs.lf = {
    enable = true;
  };

  home.packages = with pkgs; [
    ctpv
  ];

  xdg.configFile."lf" = {
    source = ./config;
    recursive = true;
  };
}
