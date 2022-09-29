{ pkgs, ... }:

{
  imports = [(import ./hardware-configuration.nix)];

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;

    loader = {
      grub = {
        enable = true;
        device = "/dev/vda";
        version = 2;
        efiSupport = false;
        useOSProber = true;
        configurationLimit = 2;
      };
      timeout = 1;
    };
  };

  networking.hostName = "vm-nixos";
}
