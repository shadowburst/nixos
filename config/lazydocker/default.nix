{ pkgs, ... }:

{
  home.packages = with pkgs; [
    lazydocker
  ];

  xdg.configFile."lazydocker/config.yml" = {
    source = ./config.yml;
  };
}
