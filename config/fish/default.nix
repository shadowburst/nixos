{ pkgs, ... }:

{
  programs.fish = {
    enable = true;
    functions = {
      fish_user_key_bindings = "fish_vi_key_bindings";
      extract = ''
        if test -f $argv
            switch $argv
                case "*.tar.bz2"
                    tar xjf $argv
                case "*.tar.gz"
                    tar xzf $argv
                case "*.bz2"
                    bunzip2 $argv
                case "*.rar"
                    rar x $argv
                case "*.gz"
                    gunzip $argv
                case "*.tar"
                    tar xf $argv
                case "*.tbz2"
                    tar xjf $argv
                case "*.tgz"
                    tar xzf $argv
                case "*.zip"
                    unzip $argv
                case "*.Z"
                    uncompress $argv
                case "*"
                    echo "'$argv' cannot be extracted via extract()"
            end
        else
            echo "'$argv' is not a valid file"
        end
      '';
    };

    shellAliases = {
      cp = "cp -i";
      mv = "mv -i";
      rm = "rm -i";
      grep = "grep --color=always";
      mkdir = "mkdir -p";
      ls = "exa --icons --group-directories-first --color=always";
      ll = "exa --icons --group-directories-first --color=always -la";
      lt = "exa --icons --group-directories-first --color=always -T";
    };
    shellInit = ''
      set TERM xterm-256color

      set -U fish_user_paths ~/.local/bin $fish_user_paths

      set fish_greeting
      set fish_color_command green
      set fish_color_param foreground
      set fish_color_option cyan
      set fish_color_error red
    '';
  };
}
