{ pkgs, ... }:

let
  theme = import ../../theme;

  power-menu = pkgs.writeShellScriptBin "power-menu" ''
    wlogout --protocol layer-shell --buttons-per-row 4 --margin-top 450 --margin-bottom 450 --margin-left 300 --margin-right 300
  '';
in
{
  programs.wlogout = {
    enable = true;
    layout = [
      {
        label = "lock";
        text = "󰍁";
        action = "sleep 0.3 && lock";
        keybind = "l";
      }
      {
        label = "reboot";
        text = "󰑐";
        action = "systemctl reboot";
        keybind = "r";
      }
      {
        label = "shutdown";
        text = "󰐥";
        action = "systemctl poweroff";
        keybind = "p";
      }
      {
        label = "logout";
        text = "󰍃";
        action = "hyprctl dispatch exit 0";
        keybind = "e";
      }
    ];
    style = with theme; ''
      * {
          background-image: none;
      }
      window {
          background-color: rgba(28, 31, 36, 0.9);
      }
      button {
          transition: box-shadow 0.2s ease-in-out, background-color 0.2s ease-in-out;
          margin: 2rem;
          border-width: 0;
          background-color: ${colors.bg};
          padding: 3rem 0;
          color: ${colors.fg};
          font-size: 10rem;
          font-family: "JetBrainsMono Nerd Font Mono";
      }
      button:hover {
          outline-style: none;
          color: ${colors.primary};
      }
      button:focus {
          outline-style: none;
          background-color: ${colors.primary};
          color: ${colors.bg};
      }
    '';
  };

  home.packages = [
    power-menu
  ];
}
