{
  services = {
    blueman-applet.enable = true;
    network-manager-applet.enable = true;

    fusuma = {
      enable = true;
      settings = {
        swipe = {
          "3" = {
            left = {
              command = "xdotool key alt+Right";
            };
            right = {
              command = "xdotool key alt+Left";
            };
          };
          "4" = {
            left = {
              command = "leftwm-command FocusPreviousTag";
            };
            right = {
              command = "leftwm-command FocusNextTag";
            };
          };
        };
        interval = {
          swipe = 0.5;
          pinch = 0.2;
        };
        threshold = {
          swipe = 0.3;
          pinch = 0.2;
        };
      };
    };
  };
}
