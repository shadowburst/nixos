{ pkgs, ... }:

{
  programs.emacs = {
    enable = true;
  };

  home.packages = with pkgs; [
    coreutils
    fd
    ripgrep
  ];

  xdg.configFile."doom" = {
    source = ./config;
    recursive = true;
  };
}
