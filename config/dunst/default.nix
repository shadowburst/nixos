{ config, lib, pkgs, ... }:

let
  theme = import ../../theme;
in
{
  services.dunst = {
    enable = true;
    iconTheme = with theme; {
      name = icons.name;
      package = pkgs."${icons.packageName}";
      size = "32x32";
    };
    settings = with theme; {
      global = {
        monitor = 0;
        follow = "mouse";
        width = 400;
        height = 500;
        origin = "top-right";
        offset = "8x48";
        scale = 0;
        notification_limit = 10;
        progress_bar = true;
        progress_bar_height = 10;
        progress_bar_frame_width = 0;
        progress_bar_min_width = 150;
        progress_bar_max_width = 400;
        highlight = colors.primary;
        indicate_hidden = true;
        transparency = 0;
        separator_height = 4;
        separator_color = "frame";
        padding = 8;
        horizontal_padding = 8;
        text_icon_padding = 10;
        frame_width = 3;
        frame_color = colors.bg;
        gap_size = 0;
        sort = true;
        font = "${fonts.normal} 11";
        line_height = 0;
        markup = "full";
        format = ''<span font="${fonts.normal} 14"><b>%s</b></span>\n%b'';
        alignment = "left";
        vertical_alignment = "center";
        show_age_threshold = 60;
        ellipsize = "end";
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
        dmenu = "${pkgs.fuzzel}/bin/fuzzel --dmenu";
        browser = "${pkgs.xdg-utils}/bin/xdg-open";
        always_run_script = true;
        title = "Dunst";
        class = "Dunst";
        corner_radius = 15;
        ignore_dbusclose = false;
        force_xwayland = false;
        force_xinerama = false;
        mouse_left_click = "do_action, open_url, close_current";
        mouse_middle_click = "close_all";
        mouse_right_click = "context";
      };
      urgency_low = {
        background = colors.bg;
        foreground = colors.fg;
        timeout = 5;
      };
      urgency_normal = {
        background = colors.bg;
        foreground = colors.fg;
        frame_color = colors.primary;
        timeout = 5;
      };
      urgency_critical = {
        background = colors.bg;
        foreground = colors.fg;
        frame_color = colors.danger;
        timeout = 0;
      };
    };
  };

  xdg.configFile."dunst/scripts" = {
    source = ./scripts;
    recursive = true;
  };
}
