{
  services.kanshi = {
    enable = true;
    profiles = {
      undocked = {
        outputs = [
          {
            criteria = "eDP-1";
            mode = "1920x1200@60Hz";
            scale = 1.00;
          }
        ];
      };
      docked = {
        outputs = [
          {
            criteria = "eDP-1";
            mode = "1920x1200@60Hz";
            position = "0,120";
            scale = 1.00;
          }
          {
            criteria = "DP-1";
            mode = "3440x1440@100Hz";
            position = "1920,0";
            scale = 1.00;
            adaptiveSync = true;
          }
        ];
      };
    };

  };
}
