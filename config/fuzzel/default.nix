{
  programs.fuzzel = {
    enable = true;
  };

  xdg.configFile.fuzzel = {
    source = ./config;
    recursive = true;

  };
}
