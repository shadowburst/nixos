{
  programs.git = {
    enable = true;
    userName = "ShadowBurst";
    userEmail = "37303345+shadowburst@users.noreply.github.com";
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
      pull = {
        rebase = "true";
      };
      core = {
        pager = "nvim -R";
      };
      color = {
        pager = "no";
      }
    };
  };
}
