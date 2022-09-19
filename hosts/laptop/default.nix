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
    autorandr = {
      enable = true;
      profiles = {
        mobile = {
          fingerprint = {
            "eDP-1" = "00ffffffffffff004d10f91400000000151e0104a51d12780ede50a3544c99260f505400000001010101010101010101010101010101283c80a070b023403020360020b410000018203080a070b023403020360020b410000018000000fe0056564b3859804c513133344e31000000000002410332001200000a010a20200080";
          };
          config = {
            "eDP-1" = {
              enable = true;
              primary = true;
              position = "0x0";
              mode = "1920x1200";
              rate = "59.95";
              crtc = 0;
            };
          };
        };
        docked = {
          fingerprint = {
            "eDP-1" = "00ffffffffffff004d10f91400000000151e0104a51d12780ede50a3544c99260f505400000001010101010101010101010101010101283c80a070b023403020360020b410000018203080a070b023403020360020b410000018000000fe0056564b3859804c513133344e31000000000002410332001200000a010a20200080";
            "DP-1" = "00ffffffffffff003103003400000000011e0104a54f21783feed5a3544c99230f5054a54b0081c081809500a9c0b300d1c0714f0101f57c70a0d0a02950302035001e4e3100001a023a801871382d40302035001e4e3100001a000000fd003065a0a041010a202020202020000000fc0050474d3334300a2020202020200117020319f14c901f0514041303120102115b23097f0783010000a448b86861a03250302035001e4e3100001eb84700a0a0382d40302035001e4e3100001e44d070a0d0a02950302035001e4e3100001a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d0";
          };
          config = {
            "eDP-1" = {
              enable = true;
              primary = false;
              position = "0x240";
              mode = "1920x1200";
              rate = "59.95";
              crtc = 1;
            };
            "DP-1" = {
              enable = true;
              primary = true;
              position = "1920x0";
              mode = "3440x1440";
              rate = "100.00";
              crtc = 0;
            };
          };
        };
      };
      hooks = {
        postswitch = {
          "refresh-wm" = ''
            case "$(wmctrl -m | awk '/Name:/ {print $2}')" in
                "LeftWM") leftwm-command "SoftReload" ;;
                "*") ;;
            esac
          '';
        };
      };
    };
  };
}
