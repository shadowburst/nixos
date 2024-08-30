{ lib, pkgs, ... }:

let
  tmux-sessionizer = pkgs.writeShellScriptBin "tmux-sessionizer" (lib.fileContents ./bin/tmux-sessionizer);
in
{
  programs.tmux = {
    enable = true;
  };

  xdg.configFile."tmux" = {
    source = ./config;
    recursive = true;
  };

  home.packages = [ 
    tmux-sessionizer
  ];
}
