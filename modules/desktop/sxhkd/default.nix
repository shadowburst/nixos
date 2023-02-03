{ config, lib, ... }:

{
  config = lib.mkIf (config.xsession.enable) {
    services.sxhkd = {
      enable = true;
      keybindings = {
        "super + a" = "${config.xdg.configHome}/rofi/scripts/appmenu.sh";
        "super + x" = "${config.xdg.configHome}/rofi/scripts/powermenu.sh";
        "control + shift + Escape" = "$TERMINAL -e htop";
        "super + Return" = "$TERMINAL";
        "super + b" = "$BROWSER";
        "super + e" = "emacsclient -c -a 'emacs' --eval '(ranger)'";
        "super + d" = "${config.xdg.configHome}/leftwm/scripts/launch_default.sh";
        "XF86AudioMute" = "amixer -D pulse set Master 1+ toggle && ${config.xdg.configHome}/dunst/scripts/on-volume-change.sh";
        "{XF86AudioLowerVolume,XF86AudioRaiseVolume}" = "amixer -D pulse sset Master {'5%-','5%+'} && ${config.xdg.configHome}/dunst/scripts/on-volume-change.sh";
        "{XF86AudioPrev,XF86AudioPlay,XF86AudioPause,XF86AudioNext}" = "playerctl {previous,play-pause,play-pause,next}";
        "{XF86MonBrightnessDown,XF86MonBrightnessUp}" = "light -{U,A} 5 && ${config.xdg.configHome}/dunst/scripts/on-brightness-change.sh";
        "XF86Calculator" = "gnome-calculator";
        "{_,shift} + Print" = "flameshot {full,gui}";
      };
    };
  };
}
