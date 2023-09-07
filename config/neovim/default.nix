{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    extraPackages = with pkgs; [
      cargo
      luajitPackages.luacheck
      luajitPackages.luarocks
      nodejs
      nodePackages.npm
      prettierd
      shellcheck
      shfmt
      stylua
      yamlfmt
    ];
  };

  xdg.configFile."nvim" = {
    source = ./config;
    recursive = true;
  };
}
