{ pkgs, ...}:

{
  programs.emacs = {
    enable = true;
  };

  home.packages = with pkgs; [
    fd
    ripgrep
  ];

  
  xdg.configFile."doom" = {
    source = ./config;
    recursive = true;
    onChange = ''
      #!/usr/bin/env bash

      DOOM="$HOME/.emacs.d"

      if [ ! -d "$DOOM" ]; then
          git clone https://github.com/hlissner/doom-emacs.git $DOOM
          $DOOM/bin/doom -y install
      fi
      $DOOM/bin/doom sync
    '';
  };
}
