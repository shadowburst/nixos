{ pkgs, ... }:

{
  xsession = {
    enable = true;
    numlock.enable = true;
    initExtra = ''
      sysresources=/etc/X11/xinit/.Xresources
      userresources="$HOME/.Xresources"

      sysmodmap=/etc/X11/xinit/.Xmodmap
      usermodmap="$HOME/.Xmodmap"

      sysprofile=/etc/xprofile
      userprofile="$HOME/.xprofile"

      [ -f "$sysresources" ] && xrdb -merge "$sysresources"
      [ -f "$userresources" ] && xrdb -merge "$userresources"

      [ -f "$sysmodmap" ] && xmodmap "$sysmodmap"
      [ -f "$usermodmap" ] && xmodmap "$usermodmap"

      [ -f "$sysprofile" ] && . "$sysprofile"
      [ -f "$userprofile" ] && . "$userprofile"

      exec leftwm;
    '';
    profileExtra = ''
      # eval $(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg)
      # export SSH_AUTH_SOCK

      # Load the polkit agent
      /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

      # Load xfce settings
      xfsettingsd &
      (sleep 3 && xfce4-power-manager) &
    '';
    pointerCursor = {
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
      size = 16;
    };
  };
}
