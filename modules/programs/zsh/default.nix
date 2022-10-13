{
  programs.zsh = {
    enable = true;
    enableAutoSuggestions = true;
    enableCompletion = true;
    enableSyntaxHighlighting = true;
    defaultKeymap = "viins";
  };

  environment.pathsToLink = [ "/share/zsh" ];
}
