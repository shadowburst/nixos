{ pkgs, ... }:

{
  home.packages = with pkgs; [
    tremc
  ];

  xdg.configFile."tremc/settings.cfg" = {
    source ./settings.cfg;
  };
}
