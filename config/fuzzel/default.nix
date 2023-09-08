{
  programs.fuzzel = {
    enable = true;
  };

  xdg.configFile."fuzzel" = {
    source = ./config;
    recursive = true;
  };

  home.file.".local/bin/app-menu" = {
    source = ./bin/app-menu;
    executable = true;
  };
}
