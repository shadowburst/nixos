{ lib, pkgs, user, stateVersion, ... }:

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

  networking.networkManager.enable = true;

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
    valiables = {
      TERMINAL = "alacritty";
      BRAVE = "brave";
      EDITOR = "emacsclient -t"
    };

    systemPackages = with pkgs; [
      cmake
      curl
      wget
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
    cron.enable = true;
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
        adresses = true;
        userServices = true;
      };
    };

    nfs.server = {
      enable = true;
      exports = ''
        /home/${user}/Public  192.168.1.0/24()
      '';
    };

    xserver = {
      numlock.enable = true;
      layout = "fr";
      xkbdVariant = "azerty";
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
      auto-optimize-store = true;
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };

    package = pkgs.nixFlakes;
    registry.nixpkgs.flake = inputs.nixpkgs;
    extraOptions = ''
      experimental-features = nix-command flakes
      keep-outputs          = true
      keep-derivations      = true
    '';
  };
  nixpkgs.config.allowUnfree = true;
}
