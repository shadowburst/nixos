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
      fade = true;
      fadeDelta = 100;
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
        ];
        round-borders = 15;
        round-borders-exclude = [
          "window_type = 'dock'"
          "class_g = 'i3lock'"
          "class_g = 'Rofi'"
        ];

        animations = true;
        animation-stiffness = 100;
        animation-window-mass = 0.4;
        animation-dampening = 10;
        animation-clamping = true;
        animation-for-open-window = "slide-down";
        animation-for-unmap-window = "zoom";
        animation-for-transient-window = "slide-down";

        blur = {
          method = "dual_kawase";
          strength = 8.0;
          deviation = 1.0;
          kernel = "11x11gaussian";
        };

        detect-rounded-corners = true;
        detect-client-opacity = false;
        detect-transient = true;
        detect-client-leader = false;
        mark-wmwim-focused = true;
        mark-ovredir-focues = true;
        unredir-if-possible = true;
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
