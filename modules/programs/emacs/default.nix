{
  programs.emacs = {
    enable = true;
  };

  home.programs = with pkgs; [
    ripgrep
  ];

  
  xdg.configFile."doom" = {
    source ./config;
    recursive = true;
    onChange = ./doom.sh;
  }
}
