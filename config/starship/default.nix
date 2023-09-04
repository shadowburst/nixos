{ lib, ... }:

{
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    enableZshIntegration = true;

    settings = {
      format = lib.concatStrings [
        " $username"
        "$hostname"
        "$localip"
        "$shlvl"
        "$directory"
        "$git_branch"
        "$git_commit"
        "$git_state"
        "$git_metrics"
        "$git_status"
        "$hg_branch"
        "$docker_context"
        "$package"
        "$lua"
        "$nodejs"
        "$php"
        "$python"
        "$nix_shell"
        "$memory_usage"
        "$env_var"
        "$sudo"
        "$cmd_duration"
        "$line_break"
        "$jobs"
        "$battery"
        "$time"
        "$status"
        "$container"
        "$shell"
        "$character"
      ];

      directory = {
        style = "bold bright-blue";
        format = "[ $path]($style) ";
      };

      git_branch = {
        style = "bold bright-purple";
      };
    };
  };
}
