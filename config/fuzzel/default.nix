{ lib, pkgs, ... }:

let
  theme = import ../../theme;

  app-menu = pkgs.writeShellScriptBin "app-menu" ''
    fuzzel
  '';
in
{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        dpi-aware = "no";
        fields = "filename,name,generic";
        font = theme.fonts.normal;
        fuzzy = "yes";
        horizontal-pad = 15;
        icon-theme = theme.icons.name;
        icons-enabled = "yes";
        image-size-ratio = 1;
        inner-pad = 0;
        layer = "overlay";
        letter-spacing = 0;
        line-height = 36;
        lines = 15;
        prompt = " ";
        show-actions = "no";
        tabs = 8;
        vertical-pad = 15;
        width = 50;
      };
      colors = {
        background = "${lib.removePrefix "#" theme.colors.black}FF";
        match = "${lib.removePrefix "#" theme.colors.primary}FF";
        selection = "${lib.removePrefix "#" theme.colors.bg}FF";
        selection-match = "${lib.removePrefix "#" theme.colors.primary}FF";
        selection-text = "${lib.removePrefix "#" theme.colors.fg}FF";
        text = "${lib.removePrefix "#" theme.colors.fg}FF";
      };
      border = {
        radius = 13;
        width = 0;
      };
      key-bindings = {
        cancel = "Escape Control+c";
        delete-line = "Control+0";
        delete-next = "Delete KP_Delete";
        delete-next-word = "Control+Delete Control+KP_Delete";
        delete-prev = "BackSpace";
        delete-prev-word = "Control+BackSpace";
        next = "Down Control+j";
        next-page = "Page_Down KP_Page_Down Control+d";
        prev = "Up Control+k";
        prev-page = "Page_Up KP_Page_Up Control+u";
      };
    };
  };

  home.packages = [
    app-menu
  ];
}
