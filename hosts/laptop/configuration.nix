{ config, lib, pkgs, ... }:

{
  imports = [ (import ./hardware-configuration.nix) ];

  boot = {
    kernelPackages = pkgs.linuxPackages_zen;

    loader = {
      grub = {
        enable = true;
        devices = [ "nodev" ];
        efiSupport = true;
        useOSProber = true;
        configurationLimit = 5;
      };

      efi = {
        canTouchEfiVariables = true;
      };

      timeout = 1;
    };
  };

  hardware = {
    bluetooth.enable = true;
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };
    # printers = {
    #   ensureDefaultPrinter = "Brother";
    #   ensurePrinters = [
    #     {
    #       name = "Brother";
    #       model = "everywhere IPP Everywhere";
    #       deviceUri = "ipp://192.168.1.85/ipp/print";
    #     }
    #   ];
    # };
    # sane = {
    #   enable = true;
    #   brscan4 = {
    #     enable = true;
    #     netDevices.Brother = {
    #       model = "DCP-J785DW";
    #       ip = "192.168.1.85";
    #     };
    #   };
    # };
  };
  powerManagement.cpuFreqGovernor = "performance";

  networking.hostName = "xps";

  environment.variables = {
    LIBVA_DRIVER_NAME = "iHD";
  };

  services = {
    auto-cpufreq.enable = true;
    blueman.enable = true;
    fstrim.enable = true;
    fwupd.enable = true;
    pipewire = {
      enable = true;
      audio.enable = true;
      pulse.enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
    };
    printing.enable = true;
    # tlp.enable = true;
  };
}
