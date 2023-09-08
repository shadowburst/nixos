{ pkgs, ... }:

{
  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
  };

  home.file.".local/bin/lock" = {
    source = ./bin/lock;
    executable = true;
  };
}
