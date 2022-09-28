{
  xdg.configFile."transmission-daemon/scripts/torrent-done.sh" = {
    source = ''
      #!/usr/bin/env bash

      notify-send "Transmission" "$TR_TORRENT_NAME has finished downloading"
    '';
    executable = true;
  };
}
