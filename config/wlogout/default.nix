{
  programs.wlogout = {
    enable = true;
  };

  home.file = {
    ".local/bin/power-menu" = {
      source = ./bin/power-menu;
      executable = true;
    };
  };
}
