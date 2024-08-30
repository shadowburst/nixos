{ ... }:

{
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = false;
      splash = false;
      preload = [
        "~/.dotfiles/wallpapers/current.jpg"
      ];
      wallpaper = [
        ",~/.dotfiles/wallpapers/current.jpg"
      ];
    };
  }
}
