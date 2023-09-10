{ pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mod" = "SUPER";
      monitor = [
        # "DP-1, highres"
        # "eDP-1, highres"
        ", highres, auto, 1"
        ", addreserved, 42, 0, 0, 0"
      ];
      workspace = [
        "1, default:true"
      ];
      exec-once = [
        "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1 &"
        "~/.config/hypr/scripts/on-startup.sh"
      ];
      exec = [
        "~/.config/hypr/scripts/on-reload.sh"
      ];
      general = {
        border_size = 3;
        gaps_in = 4;
        gaps_out = 6;
        "col.inactive_border" = "rgb(1b1d2b)";
        "col.active_border" = "rgb(82aaff)";
        layout = "master";
      };
      decoration = {
        rounding = 8;
        drop_shadow = false;
        shadow_range = 4;

        blur = {
          enabled = true;
          size = 6;
          xray = true;
        };
      };
      animations = {
        enabled = true;
        bezier = [
          "overshot, 0.13, 0.99, 0.29, 1.1"
        ];
        animation = [
          "windows, 1, 3, overshot, slide"
          "border, 0, 10, default"
          "fade, 1, 3, default"
          "workspaces, 1, 4, overshot, slide"
        ];
      };
      input = {
        kb_layout = "fr";
        kb_variant = "azerty";
        numlock_by_default = true;
        follow_mouse = 1;

        touchpad = {
          disable_while_typing = true;
          natural_scroll = true;
          drag_lock = true;
        };
      };
      gestures = {
        workspace_swipe = true;
        workspace_swipe_fingers = 4;
      };
      dwindle = {
        force_split = 2;
      };
      master = {
        new_is_master = false;
        no_gaps_when_only = false;
        mfact = 0.5;
        orientation = "left";
        always_center_master = false;
      };
      misc = {
        disable_hyprland_logo = true;
        vfr = true;
        vrr = 2;
        allow_session_lock_restore = true;
        mouse_move_enables_dpms = true;
        key_press_enables_dpms = true;
        enable_swallow = true;
        swallow_regex = "^Alacritty|kitty$";
      };
      windowrule = [
        "float, org.gnome.Calculator"
        "minsize 300 500, org.gnome.Calculator"
        "idleinhibit focus, ^(yuzu)$"
      ];
      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
      bindr = [
        "$mod, SUPER_L, exec, ~/.local/bin/app-menu"
      ];
      bind = [
        # Compositor
        "$mod SHIFT, r, exec, hyprctl reload"

        # Windows
        "CTRL ALT, delete, exec, hyprctl kill"
        "$mod, q, killactive,"
        "$mod, c, togglefloating,"
        "$mod, p, pin,"
        "$mod, f, fullscreen, 0"
        "$mod, space, fullscreen, 1"
        "ALT, tab, cyclenext,"
        "ALT SHIFT, tab, cyclenext, prev"
        "$mod, h, movefocus, l"
        "$mod, j, movefocus, d"
        "$mod, k, movefocus, u"
        "$mod, l, movefocus, r"
        "$mod SHIFT, h, movewindow, l"
        "$mod SHIFT, j, movewindow, d"
        "$mod SHIFT, k, movewindow, u"
        "$mod SHIFT, l, movewindow, r"

        # Workspaces
        "$mod, ampersand, exec, ~/.config/hypr/scripts/workspace.sh 1"
        "$mod, eacute, exec, ~/.config/hypr/scripts/workspace.sh 2"
        "$mod, quotedbl, exec, ~/.config/hypr/scripts/workspace.sh 3"
        "$mod, apostrophe, exec, ~/.config/hypr/scripts/workspace.sh 4"
        "$mod, parenleft, exec, ~/.config/hypr/scripts/workspace.sh 5"
        "$mod, minus, exec, ~/.config/hypr/scripts/workspace.sh 6"
        "$mod, egrave, exec, ~/.config/hypr/scripts/workspace.sh 7"
        "$mod SHIFT, ampersand, movetoworkspacesilent, 1"
        "$mod SHIFT, eacute, movetoworkspacesilent, 2"
        "$mod SHIFT, quotedbl, movetoworkspacesilent, 3"
        "$mod SHIFT, apostrophe, movetoworkspacesilent, 4"
        "$mod SHIFT, parenleft, movetoworkspacesilent, 5"
        "$mod SHIFT, minus, movetoworkspacesilent, 6"
        "$mod SHIFT, egrave, movetoworkspacesilent, 7"
        "$mod SHIFT CTRL, ampersand, movetoworkspace, 1"
        "$mod SHIFT CTRL, eacute, movetoworkspace, 2"
        "$mod SHIFT CTRL, quotedbl, movetoworkspace, 3"
        "$mod SHIFT CTRL, apostrophe, movetoworkspace, 4"
        "$mod SHIFT CTRL, parenleft, movetoworkspace, 5"
        "$mod SHIFT CTRL, minus, movetoworkspace, 6"
        "$mod SHIFT CTRL, egrave, movetoworkspace, 7"

        # Monitors
        "$mod, tab, swapactiveworkspaces, current -1"
        "$mod CTRL, h, focusmonitor, l"
        "$mod CTRL, j, focusmonitor, d"
        "$mod CTRL, k, focusmonitor, u"
        "$mod CTRL, l, focusmonitor, r"
        "$mod SHIFT CTRL, h, movewindow, mon:l"
        "$mod SHIFT CTRL, j, movewindow, mon:d"
        "$mod SHIFT CTRL, k, movewindow, mon:u"
        "$mod SHIFT CTRL, l, movewindow, mon:r"

        # Menus
        "$mod, x, exec, ~/.local/bin/power-menu"

        # Applications
        "$mod, return, exec, $TERMINAL"
        "$mod, b, exec, $BROWSER"
        "$mod, d, exec, ~/.config/hypr/scripts/launch-default.sh"
        "$mod, e, exec, $TERMINAL -e lf"
        "CTRL SHIFT, escape, exec, $TERMINAL -e bashtop"
        ", xf86calculator, exec, gnome-calculator"

        # Audio
        ", xf86audiomute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle && ~/.config/dunst/scripts/notify-volume"
        ", xf86audiolowervolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ '5%-' && ~/.config/dunst/scripts/notify-volume"
        ", xf86audioraisevolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ '5%+' && ~/.config/dunst/scripts/notify-volume"
        ", xf86audioprev, exec, playerctl previous"
        ", xf86audioplay, exec, playerctl play-pause"
        ", xf86audiopause, exec, playerctl play-pause"
        ", xf86audionext, exec, playerctl next"

        # Brightness
        ", xf86monbrightnessdown, exec, light -U 5 && ~/.config/dunst/scripts/notify-brightness"
        ", xf86monbrightnessup, exec, light -A 5 && ~/.config/dunst/scripts/notify-brightness"

        # Screenshots
        ", print, exec, grimshot --notify copy screen"
        "SHIFT, print, exec, grimshot --notify copy area"
        "CTRL, print, exec, grimshot --notify save screen"
        "CTRL SHIFT, print, exec, grimshot --notify save area"
      ];
    };
  };

  xdg.configFile."hypr/scripts" = {
    source = ./scripts;
    recursive = true;
  };
}
