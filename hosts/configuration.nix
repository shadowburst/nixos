{ lib, nixpkgs, pkgs, user, stateVersion, ... }:

{
  system.stateVersion = stateVersion;

  users.users.${user} = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkManager" "lp" "scanner" "kvm" "libvertd" ];
    shell = pkgs.zsh;
  };

  time.timeZone = "Europe/Paris";
  i18n = {
    defaultLocale = "en_GB.UTF-8";
  };

  console.keyMap = "fr";

  networking.networkmanager.enable = true;

  hardware.sane = {
    enable = true;
    extraBackends = [ pkgs.brscan5 ];
  };

  sound = {
    enable = true;
    mediaKeys.enable = true;
  };
  security.rtkit.enable = true;

  environment = {
    variables = {
      TERMINAL = "alacritty";
      BRAVE = "brave";
      EDITOR = "emacsclient -t";
    };

    systemPackages = with pkgs; [
      cmake
      curl
      wget
      xdg-utils
      xorg.xrandr
    ];
  };

  fonts = {
    enableDefaultFonts = true;
    fonts = with pkgs; [
      corefonts
      noto-fonts
      noto-fonts-emoji
      (nerdfonts.override {
        fonts = [ "JetBrainsMono" ];
      })
    ];
    fontconfig.defaultFonts = {
      serif = [ "Noto Sans" ];
      sansSerif = [ "Noto Sans" ];
      monospace = [ "Noto Sans Mono" ];
    };
  };

  services = {
    cron = {
      enable = true;
      systemCronJobs = [
        "0 */1 * * * ${pkgs.transmission}/bin/transmission-remote -l | grep 100\% | grep Done | awk '{print $1}' | xargs -n 1 -I \% ${pkgs.transmission}/bin/transmission-remote -t \% -r"
      ];
    };
    openssh.enable = true;
    printing.enable = true;

    pipewire = {
      enable = true;
      pulse.enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
    };

    avahi = {
      enable = true;
      nssmdns = true;
      publish = {
        enable = true;
        addresses = true;
        userServices = true;
      };
    };

    nfs.server = {
      enable = true;
      exports = ''
        /home/${user}/Public  192.168.1.0/24()
      '';
    };

    transmission = {
      enable = true;
      settings = {
        alt-speed-down = 50;
        alt-speed-enabled = false;
        alt-speed-time-begin = 540;
        alt-speed-time-day = 127;
        alt-speed-time-enabled = false;
        alt-speed-time-end = 1020;
        alt-speed-up = 50;
        bind-address-ipv4 = "0.0.0.0";
        bind-address-ipv6 = "::";
        blocklist-enabled = true;
        blocklist-url = "https://github.com/Naunter/BT_BlockLists/raw/master/bt_blocklists.gz";
        cache-size-mb = 4;
        dht-enabled = true;
        download-dir = "/home/${user}/Videos";
        download-queue-enabled = true;
        download-queue-size = 4;
        encryption = 1;
        idle-seeding-limit = 30;
        idle-seeding-limit-enabled = false;
        incomplete-dir = "/home/${user}/Downloads";
        incomplete-dir-enabled = false;
        lazy-bitfeild-enabled = true;
        lpd-enabled = false;
        message-level = 1;
        peer-congestion-algorithm = "";
        peer-forwarding-enabled = true;
        peer-id-ttl-hours = 6;
        peer-limit-global = 240;
        peer-limit-per-torrent = 60;
        peer-port = 51413;
        peer-port-random-high = 65535;
        peer-port-random-low = 1024;
        peer-port-random-on-start = false;
        peer-socket-tos = "default";
        pex-enabled = true;
        port-forwarding-enabled = true;
        preallocation = 1;
        prefetch-enabled = true;
        queue-stalled-enabled = true;
        queue-stalled-minutes = 30;
        ratio-limit = 2;
        ratio-limit-enabled = false;
        rename-partial-files = true;
        rpc-authentication-required = false;
        rpc-bind-address = "0.0.0.0";
        rpc-enabled = true;
        rpc-host-whitelist = "";
        rpc-host-whitelist-enabled = true;
        rpc-password = "{0b6f859e9f996e5c1910ea0561010ad4f4d9cd8ffB99blR6";
        rpc-port = 9091;
        rpc-url = "/transmission/";
        rpc-username = "";
        rpc-whitelist = "127.0.0.1";
        rpc-whitelist-enabled = true;
        scrape-paused-torrents-enabled = true;
        script-torrent-done-enabled = true;
        script-torrent-done-filename = "/home/${user}/.config/transmission-daemon/scripts/torrent-done.sh";
        seed-queue-enabled = true;
        seed-queue-size = 5;
        speed-limit-down = 6000;
        speed-limit-down-enabled = true;
        speed-limit-up = 150;
        speed-limit-up-enabled = true;
        start-added-torrents = true;
        trash-original-torrent-files = true;
        umask = 18;
        upload-slots-per-torrent = 14;
        utp-enabled = true;
        watch-dir = "/home/${user}/Downloads";
        watch-dir-enabled = true;
      };
    };

    xserver = {
      layout = "fr";
      xkbVariant = "azerty";
      displayManager = {
        startx.enable = true;
        defaultSession = "none+leftwm";
      };
      windowManager = {
        leftwm.enable = true;
      };
    };
  };

  nix = {
    settings = {
      auto-optimise-store = true;
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };

    # package = pkgs.nixFlakes;
    registry.nixpkgs.flake = nixpkgs;
    extraOptions = ''
      experimental-features = nix-command flakes
      keep-outputs          = true
      keep-derivations      = true
    '';
  };
  nixpkgs.config.allowUnfree = true;
}
