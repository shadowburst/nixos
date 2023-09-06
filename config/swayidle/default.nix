{
  services.swayidle = {
    enable = true;
    timeouts = [
      {
        timeout = 10;
        command = "pgrep swaylock && hyprctl dispatch dpms off &";
      }
    ];
  };
}
