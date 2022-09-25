{ config, lib, pkgs, ... }:

let
  theme = import ../../theme;
in {
  home.packages = with pkgs; [
    libnotify
  ];

  services.dunst = {
    enable = true;
    iconTheme = {
      inherit theme.iconTheme;
      size = "32x32";
    };
    settings = {
      global = {
        monitor = 0;
        follow = "none";
        width = 400;
        height = 500;
        origin = "top-right";
        offset = "6x42";
        scale = 0;
        notification_limit = 6;
        progress_bar = true;
        progress_bar_height = 10;
        progress_bar_frame_width = 1;
        progress_bar_min_width = 150;
        progress_bar_max_width = 300;
        indicate_hidden = true;
        transparency = 0;
        separator_height = 2;
        padding = 8;
        horizontal_padding = 8;
        text_icon_padding = 10;
        frame_width = 3;
        frame_color = theme.colors.primary;
        gap_size = 10;
        separator_color = "frame";
        sort = true;
        font = "${theme.fonts.normal} 11";
        line_height = 0;
        markup = "full";
        format = "<span font=\"${theme.fonts.normal} 14\"><b>%s</b></span>\n%b";
        alignment = left;
        vertical_alignment = "center";
        show_age_threshold = 60;
        ellipsize = "middle";
        ignore_newline = false;
        stack_duplicates = true;
        hide_duplicate_count = false;
        show_indicators = true;
        icon_position = "left";
        min_icon_size = 32;
        max_icon_size = 32;
        enable_recursive_icon_lookup = true;
        always_run_scripts = true;
        sticky_history = true;
        history_length = 20;
        dmenu = "rofi -dmenu";
        browser = /usr/bin/xdg-open;
        always_run_script = true;
        title = "Dunst";
        class = "Dunst";
        corner_radius = 15;
        ignore_dbusclose = false;
        force_xwayland = false;
        force_xinerama = false;
        mouse_left_click = "close_current";
        mouse_middle_click = "context";
        mouse_right_click = "do_action";
      };
      urgency_low = {
        background = theme.colors.bg;
        foreground = theme.colors.fg;
        timeout = 5;
      };
      urgency_normal = {
        background = theme.colors.bg;
        foreground = theme.colors.fg;
        frame_color = theme.colors.primary;
        timeout = 5;
      };
      urgency_critical = {
        background = theme.colors.bg;
        foreground = theme.colors.fg;
        frame_color = theme.colors.danger;
        timeout = 0;
      };
    };
  };
}
