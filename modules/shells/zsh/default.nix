{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    enableSyntaxHighlighting = true;
    defaultKeymap = "viins";
    profileExtra = ''
      if [ "$(tty)" = "/dev/tty1" ]; then
          pgrep leftwm || exec startx
      fi
    '';
    initExtraFirst = ''
      exec fish
    '';
  };
}
