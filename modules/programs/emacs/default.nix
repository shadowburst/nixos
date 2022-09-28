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
    onChange = builtins.readFile ./doom.sh;
  };
}
