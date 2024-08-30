{ ... }:

let
  theme = import ../../../theme;
in 
  {
  services.hyprlock = {
    enable = true;
    settings = {
      background = [
        {
          monitor = "";
          path = "screenshot";
          blur_passes = 2;
          blur_size = 6;
          brightness = 0.4;
        }
      ];

      label = [
        {
          position = "0, 160";
          halign = "center";
          valign = "center";
          text = ''
            cmd[update:1000] echo "<span foreground='##c8d3f5' font_weight='bold'>$(date +%H:%M)</span>"
          '';
          font_size = 100;
          font_family = theme.font.normal;
        }
        {
          position = "0, 70";
          halign = "center";
          valign = "center";
          text = ''
            cmd[update:1000] echo "<span foreground='##c8d3f5'>$(date +%d/%m/%Y)</span>"
          '';
          font_size = 30;
          font_family = theme.font.normal;
        }
      ];

      input-field = [
        {
          size = "200, 50";
          position = "0, 0";
          halign = "center";
          valign = "center";

          rounding = 11;
          outer_color = "rgb(1b1d2b)";
          inner_color = "rgb(222436)";
          font_color = "rgb(c8d3f5)";
          fail_color = "rgb(ff757f)";
          font_family = theme.font.normal;
        }
      ];
    };
  };
}
