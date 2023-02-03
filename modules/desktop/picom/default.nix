{ config, pkgs, lib, ... }:

{
  config = lib.mkIf (config.xsession.enable) {
    services.picom = {
      enable = true;
      package = pkgs.picom.overrideAttrs(o: {
        src = pkgs.fetchFromGitHub {
          repo = "picom";
          owner = "dccsillag";
          rev = "eB758eb5e572d5d7cf28f28e5e409f 20eBbd2ded";
          sha256 = "1qhpl0z52d71diclamnlv2igy3l361cqxzbkqyfxvhy5lf80airg";
        };
      });

      backend = "glx";
      vSync = true;

      shadow = false;
      shadowOpacity = 0.75;
      shadowExclude = [
        "name = 'Notification'",
        "class_g = 'Conky'",
        "class_g ?= 'Notify-osd'",
        "class_g = 'Cairo-clock'",
        "class_g = 'slop'",
        "class_g = 'Rofi'",
        "_GTK_FRAME_EXTENTS@:c",
        "_NET_WM_STATE@:32a *= '_NET_WM_STATE_HIDDEN'"
      ];
      fade = true;
      fadeDelta = 3;
      fadeSteps = [0.03 0.03];
      opacityRules = [];

      settings = {
        daemon = false;
        use-damage = false;
        resize-damage = 1;
        refresh-rate = 0;
        corner-radius = 15;
        round-corners-exclude = [
          "window_type = 'dock'"
          "class_g = 'i3lock'"
          "class_g = 'Rofi'"
          "class_g = 'Dunst'"
        ];
        round-borders = 15;
        round-borders-exclude = [
          "window_type = 'dock'"
          "class_g = 'i3lock'"
          "class_g = 'Rofi'"
          "class_g = 'Dunst'"
        ];

        animations = true;
        animation-stiffness = 120
        animation-window-mass = 1.0
        animation-dampening = 14
        animation-clamping = false
        animation-for-open-window = "slide-down";
        animation-for-unmap-window = "zoom";
        animation-for-transient-window = "slide-down";

        blur = {
          method = "dual_kawase";
          strength = 4.0;
          deviation = 1.0;
          kernel = "7x7gaussian";
        };
        blur-background = false;
        blur-background-frame = true;
        blur-background-fixed = true;
        blur-background-exclude = [
          "window_type = 'menu'",
          "window_type = 'dropdown_menu'",
          "window_type = 'popup_menu'",
          "window_type = 'tooltip'",
          "window_type = 'notification'",
          "_GTK_FRAME_EXTENTS@:c",
          "class_g = 'awesome'",
          "class_g *= 'eww'"
        ];

        detect-rounded-corners = true;
        detect-client-opacity = false;
        detect-transient = true;
        detect-client-leader = false;

        mark-wmwim-focused = true;
        mark-ovredir-focues = true;

        unredir-if-possible = true;
        unredir-if-possible-exclude = [
          "class_g = 'i3lock'",
          "class_g = 'mpv'"
        ];

        glx-no-stencil = true;
        glx-no-rebind-pixmap = true;
      };

      wintypes = {
        tooltip = { fade = true; shadow = false; focus = false; };
        normal = { shadow = false; };
        dock = { shadow = false; };
        dnd = { shadow = false; };
        popup_menu = { shadow = true; focus = false; opacity = config.services.picom.menuOpacity; };
        dropdown_menu = { shadow = false; focus = false; };
        above = { shadow = true; };
        splash = { shadow = false; };
        utility = { focus = false; shadow = false; blur-background = false; };
        notification = { shadow = false; };
        desktop = { shadow = false; blur-background = false; };
        menu = { focus = false; };
        dialog = { shadow = true; };
      };
    };
  };
}
