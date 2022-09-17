{ lib, pkgs, home-manager, user, stateVersion, ... }:

let
  system = "x86_64-linux";
  hostname = "xps";
in
{
  laptop = lib.nixosSystem {
    inherit system;
    specialArgs = {
      inherit user stateVersion;
    };
    modules = [
      ./laptop
      ./configuration.nix

      home-manager.nixosModules.home-manager {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPkgs = true;
        home-manager.extraSpecialArgs = {
          inherit user stateVersion;
        };
        home-manager.users.${user} = {
          imports = [(import ./home.nix)] ++ [(import ./laptop/home.nix)];
        };
      }
    ];
  };
}
