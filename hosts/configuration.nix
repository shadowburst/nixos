{ lib, pkgs, user, stateVersion, ... }:

{
  users.users.${user} = {
    isNormalUser = true;
    description = user;
    extraGroups = [
      "audio"
      "docker"
      "greeter"
      "kvm"
      "libvirtd"
      "lp"
      "networkmanager"
      "scanner"
      "video"
      "wheel"
    ];
    shell = pkgs.fish;
  };

  time.timeZone = "Europe/Paris";

  i18n = {
    defaultLocale = "en_GB.UTF-8";

    extraLocaleSettings = {
      LC_ADDRESS = "en_GB.UTF-8";
      LC_IDENTIFICATION = "en_GB.UTF-8";
      LC_MEASUREMENT = "en_GB.UTF-8";
      LC_MONETARY = "en_GB.UTF-8";
      LC_NAME = "en_GB.UTF-8";
      LC_NUMERIC = "en_GB.UTF-8";
      LC_PAPER = "en_GB.UTF-8";
      LC_TELEPHONE = "en_GB.UTF-8";
      LC_TIME = "en_GB.UTF-8";
    };
  };

  console.keyMap = "fr";

  networking = {
    firewall = {
      enable = true;
      allowedUDPPorts = [
        # Casting
        8008
        8009
      ];
    };

    networkmanager.enable = true;
  };

  security = {
    pam.services = {
      greetd.enableGnomeKeyring = true;
      swaylock = { };
    };
    polkit.enable = true;
    rtkit.enable = true;
  };

  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      corefonts
      noto-fonts
      noto-fonts-emoji
      (pkgs.nerdfonts.override {
        fonts = [ "JetBrainsMono" ];
      })
    ];
    fontconfig.defaultFonts = {
      serif = [ "Noto Sans" ];
      sansSerif = [ "Noto Sans" ];
      monospace = [ "Noto Sans Mono" ];
    };
  };

  environment.variables = {
    TERMINAL = "kitty";
    BROWSER = "brave";
    EDITOR = "nvim";
    MANPAGER = "nvim +Man!";
  };

  environment.systemPackages = with pkgs; [
    bc
    brave
    curl
    discord
    exa
    filelight
    fish
    fzf
    gcc
    gimp
    git
    gnome.gnome-calculator
    gnome.seahorse
    gnome.simple-scan
    gnumake
    gparted
    htop
    iw
    jq
    libnotify
    lutris
    pavucontrol
    pciutils
    playerctl
    polkit_gnome
    ripgrep
    socat
    sway-contrib.grimshot
    swaybg
    swayidle
    swayimg
    transmission
    trash-cli
    unzip
    wdisplays
    wget
    wl-clipboard
    xdg-utils
    xfce.thunar
    xfce.thunar-volman
  ];

  programs = {
    dconf.enable = true;
    fish.enable = true;
    gamemode.enable = true;
    light.enable = true;
    ssh.startAgent = true;
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
    };
  };

  # List services that you want to enable:
  services = {
    avahi = {
      enable = true;
      nssmdns = true;
      publish = {
        enable = true;
        addresses = true;
        userServices = true;
      };
    };
    cron = {
      enable = true;
      systemCronJobs = [
        "0 */1 * * * transmission-remote -l | grep 100\% | grep Done | awk '{print $1}' | xargs -n 1 -I \% transmission-remote -t \% -r"
      ];
    };
    dbus.enable = true;
    greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --time-format '%A %e, %B %Y' --remember --asterisks --cmd Hyprland";
        };
      };
    };
    openssh = {
      enable = true;
      allowSFTP = true;
    };
  };

  systemd = {
    services = {
      greetd.serviceConfig = {
        Type = "idle";
        StandardInput = "tty";
        StandardOutput = "tty";
        StandardError = "journal";
        TTYReset = true;
        TTYVHangup = true;
        TTYVTDisallocate = true;
      };
    };
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
  };

  virtualisation = {
    docker.enable = true;
  };

  nixpkgs.config.allowUnfree = true;

  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
    };
  };

  system = {
    inherit stateVersion;
  };
}
