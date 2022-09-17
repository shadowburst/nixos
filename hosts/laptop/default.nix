{ config, pkgs, user, ... }:

{
  imports = [(import ./hardware-configuration.nix)];

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;

    loader = {
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };

      grub = {
        enable = true;
        version = 2;
        efiSupport = true;
        useOSProber = true;
        configurationLimit = 2;
      };
      timeout = 1;
    };
  };

  programs = {
    light.enable = true;
  };

  services = {
    auto-cpufreq.enable = true;
    blueman.enable = true;
    tlp.enable = true;
  };
}
