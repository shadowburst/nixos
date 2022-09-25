{
  programs.lazydocker = {
    enable = true;
  };
  xdg.configFile."lazydocker/config.yml" = {
    source ./config.yml;
  }
}
