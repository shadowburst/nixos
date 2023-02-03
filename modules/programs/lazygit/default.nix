{ pkgs, ... }:

{
  programs.lazygit = {
    enable = true;
    settings = {
      gui.theme = {
        activeBorderColor = ["green"  "bold"];
        inactiveBorderColor = ["white"];
        optionsTextColor = ["blue"];
        selectedLineBgColor = ["default"];
        selectedRangeBgColor = ["blue"];
        cherryPickedCommitBgColor = ["blue"];
        cherryPickedCommitFgColor = ["cyan"];
      };
    };
  };
}
