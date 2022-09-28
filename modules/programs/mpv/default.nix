{ pkgs, ... }:

{
  programs.mpv = {
    enable = true;
    bindings = {
      h = "seek -5 exact";
      l = "seek +5 exact";
      j = "seek -60 exact";
      k = "seek +60 exact";
      H = "playlist-prev";
      L = "playlist-next";
      f = "cycle fullscreen";
      m = "cycle mute";
      p = "cycle pause";
      q = "quit";
      i = "show-text \"\${filename}\"";
      S = "add sub-delay -0.1";
      s = "add sub-delay +0.1";
      RIGHT = "seek +5 exact";
      LEFT = "seek -5 exact";
      DOWN = "seek -60 exact";
      UP = "seek +60 exact";
      ESC = "set fullscreen no";
      SPACE = "cycle pause";
      BS = "set speed 1.0";
      "." = "frame-step";
      "+" = "add audio-delay 0.100";
      "-" = "add audio-delay -0.100";
      "[" = "multiply speed 0.9";
      "]" = "multiply speed 1.1";
      "{" = "multiply speed 0.5";
      "}" = "multiply speed 2.0";
    };
    config = {
      fs = true;
      osc = false;
      profile = "gpu-hq";
      scale = "ewa_lanczossharp";
      cscale = "ewa_lanczossharp";
      tscale = "oversample";
      interpolation = true;
      video-sync = "display-resample";
      hwdec = "auto";
      no-window-dragging = true;
      no-osd-bar = true;
    };
    scripts = with pkgs.mpvScripts; [
      mpris
      thumbnail
    ];
  };

  xdg.configFile = {
    "mpv/scripts/modern.lua".source = ./modern.lua;
    "mpv/fonts/Material-Design-Iconic-Font.ttf".source = ./Material-Design-Iconic-Font.ttf;
  };
}
