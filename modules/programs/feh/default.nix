{ pkgs, ... }:

{
  programs.feh = {
    enable = true;
    buttons = {
      menu = 2;
      zoom = 3;
      zoom_in = 4;
      zoom_out = 5;
    };
    keybindings = {
      menu_up = [ "k" "Up" ];
      menu_down = [ "j" "Down" ];
      menu_parent = [ "h" "Left" ];
      menu_child = [ "l" "Right" ];
      menu_select = [ "space" "Return" ];
      next_img = [ "j" "Right" "space" ];
      prev_img = [ "k" "Left" "BackSpace" ];
      scroll_up = [ "K" "C-Up" ];
      scroll_down = [ "J" "C-Down" ];
      scroll_left = [ "H" "C-Left" ];
      scroll_right = [ "L" "C-Right" ];
      remove = [ "d" "Delete" ];
      delete = [ "C-d" "C-Delete" ];
      toggle_filenames = "f";
      zoom_in = [ "C-Up" "f" ];
      zoom_out = [ "C-Down" "a" ];
      zoom_default = "d";
      zoom_fit = "s";
      save_image = null;
      save_filelist = null;
    };
  };
}
