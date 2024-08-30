{ pkgs, ... }:

{
  imports = [
    ./bat
    ./cava
    ./eza
    ./fish
    ./fzf
    ./git
    ./lazydocker
    ./neovim
    ./starship
    ./tmux
    ./transmission
    ./yazi
  ];

  home.packages = with pkgs; [
    fd
    jq
    ripgrep
    sshfs
  ];
}
