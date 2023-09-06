{
  programs.wlogout = {
    enable = true;
  };

  xdg.configFile."wlogout" = {
    source = ./config;
    recursive = true;
  };

  home.file = {
    ".local/bin/power-menu" = {
      source = ./bin/power-menu;
      executable = true;
    };
  };
}
