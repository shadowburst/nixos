{ home-manager, lib, nixpkgs, nixos-hardware, stateVersion, user, ... }:

{
  laptop = lib.nixosSystem {
    specialArgs = {
      inherit nixpkgs stateVersion user;

      system = "laptop";
    };
    modules = [
      nixos-hardware.nixosModules.dell-xps-13-9310
      nixos-hardware.nixosModules.common-gpu-intel
      ./configuration.nix
      ./laptop/configuration.nix

      home-manager.nixosModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = {
          inherit stateVersion user;

          system = "laptop";
        };
        home-manager.users.${user} = {
          imports = [ 
            ./home.nix
            ./laptop/home.nix
          ];
        };
      }
    ];
  };
}
