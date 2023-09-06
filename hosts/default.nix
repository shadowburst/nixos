{ lib, nixpkgs, home-manager, hyprland, stateVersion, user, ... }:

{
  laptop = lib.nixosSystem {
    specialArgs = {
      inherit nixpkgs stateVersion user;

      system = "laptop";
    };
    modules = [
      hyprland.nixosModules.default
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
          imports = [ (import ./home.nix) ] ++ [ (import ./laptop/home.nix) ];
        };
      }
    ];
  };
}
