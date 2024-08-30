{ username, ... }:

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
      mkdir = "mkdir -p";
      grep = "grep --color=always";
      cat = "bat --color=always --plain";
      ll = "eza -la";
      hm-switch = "home-manager switch --flake ~/.config/home-manager#${username}";
      hm-build = "home-manager build --flake ~/.config/home-manager#${username}";
    };
    shellInit = ''
      set TERM xterm-256color

      set fish_greeting
      set fish_color_param foreground
      set fish_color_option cyan
      set fish_color_error red
    '';
  };
}
