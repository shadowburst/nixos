{ config, pkgs, lib, ... }:

{
  config = lib.mkIf (config.xsession.enable) {
    services.picom = {
      enable = true;
      package = pkgs.picom.overrideAttrs(o: {
        src = pkgs.fetchFromGithub {
          repo = "picom";
          owner = "jonaburg";
          rev = "e3c19cd7d1108d114552267f302548c113278d45";
          sha256 = "4voCAYd0fzJHQjJo4x3RoWz5l3JJbRvgIXn1Kg6nz6Y=";
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

        transition-length = 300;
        transition-pow-x = 0.5;
        transition-pow-y = 0.5;
        transition-pow-w = 0.5;
        transition-pow-h = 0.5;
        size-transition = true;

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
