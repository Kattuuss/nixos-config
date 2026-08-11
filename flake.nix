{
  description = "NixOS Flake configuration with Home Manager";

  inputs = {
    # Unstable branch
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    {
      nixosConfigurations = {
        kattus-qemu = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts/vm/kattus-qemu/hardware-configuration.nix
            ./hosts/vm/kattus-qemu/configuration.nix

            # Integrates Home Manager into NixOS
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "backup";

              # Imports user home.nix
              home-manager.users.kattus = ./home/home.nix;
            }
          ];
        };

        #      kattus-rog = nixpkgs.lib.nixosSystem {
        #        system = "x86_64-linux";
        #        modules = [
        #          ./hosts/laptop/nixos-rog-strix-g15/hardware-configuration.nix
        #          ./hosts/laptop/nixos-rog-strix-g15/configuration.nix
        #        ];
        #
        #          # Integrates Home Manager into NixOS
        #          home-manager.nixosModules.home-manager
        #          {
        #            home-manager.useGlobalPkgs = true;
        #            home-manager.useUserPackages = true;
        #
        #            # Imports user home.nix
        #            home-manager.users.kattus = import ./home/home.nix;
        #          }
        #      };
      };
    };
}
