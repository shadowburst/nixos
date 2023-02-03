{ pkgs, ... }:

{
  home.file.".xinitrc".text = ''
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

  xsession = {
    enable = true;
    numlock.enable = true;
    profileExtra = ''
      eval $(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg)
      export SSH_AUTH_SOCK

      /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

      xfsettingsd &
      (sleep 10 && xfce4-power-manager) &

      emacs --daemon &
    '';
  };
}
