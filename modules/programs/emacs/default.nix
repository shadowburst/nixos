{ pkgs, ...}:

{
  programs.emacs = {
    enable = true;
  };

  home.packages = with pkgs; [
    coreutils
    fd
    ripgrep
  ];

  system.userActivationScipts.emacs.text = ''
    DOOM="$HOME/.emacs.d"

    if [ ! -d "$DOOM" ]; then
        git clone https://github.com/hlissner/doom-emacs.git $DOOM
        "$DOOM/bin/doom" -y install
    fi

    "$DOOM/bin/doom" sync
  '';
  
  xdg.configFile."doom" = {
    source = ./config;
    recursive = true;
  };
}
