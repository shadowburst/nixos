{
  programs.tmux = {
    enable = true;
  };

  xdg.configFile."tmux" = {
    source = ./config;
    recursive = true;
  };

  home.file.".local/bin/tmux-sessionizer" = {
    source = ./bin/tmux-sessionizer;
    executable = true;
  };
}
