{ lib, nixpkgs, home-manager, user, stateVersion, ... }:

let
  pkgs = import nixpkgs {
    config.allowUnfree = true;
  };
in
{
  laptop = lib.nixosSystem {
    specialArgs = {
      inherit nixpkgs user stateVersion;
    };
    modules = [
      ./laptop
      ./configuration.nix

      home-manager.nixosModules.home-manager {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = {
          inherit user stateVersion;
        };
        home-manager.users.${user} = {
          imports = [(import ./home.nix)] ++ [(import ./laptop/home.nix)];
        };
      }
    ];
  };
  vm = lib.nixosSystem {
    specialArgs = {
      inherit nixpkgs user stateVersion;
    };
    modules = [
      ./vm
      ./configuration.nix

      home-manager.nixosModules.home-manager {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = {
          inherit user stateVersion;
        };
        home-manager.users.${user} = {
          imports = [(import ./home.nix)] ++ [(import ./vm/home.nix)];
        };
      }
    ];
  };
}
